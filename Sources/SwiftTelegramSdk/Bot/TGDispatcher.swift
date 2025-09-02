//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Logging

public protocol TGDispatcherPrtcl: Sendable {
    var name: String { get }
    var handlersGroup: SendableValue<[[TGHandlerPrtcl]]> { get }
    /// priority - priority of execution by handlers
    func add(_ handler: TGHandlerPrtcl, priority: Int) async
    func add(_ handler: TGHandlerPrtcl) async
    func remove(_ handler: TGHandlerPrtcl, from priority: Int?) async
    func process(_ updates: [TGUpdate]) async
}

public final class TGDefaultDispatcher: TGDispatcherPrtcl {
    public var name: String { String(describing: Self.self) }
    public let handlersGroup: SendableValue<[[TGHandlerPrtcl]]> = .init([])
    private let log: Logger
    private let handlersId: SendableValue<Int> = .init(0)
    private var nextHandlerId: Int {
        get async {
            await handlersId.change { $0 += 1 }
        }
    }
//    private var index: Int = 0

    private typealias Level = Int
    private typealias IndexId = Int
    private typealias Position = Int
    private let handlersIndex: SendableValue<[Level: [IndexId: Position]]> = .init([:])

    required public init(log: Logger) async throws {
        self.log = log
    }

    public func add(_ handler: TGHandlerPrtcl, priority: Int) async {
        /// add uniq index id
        let handler: TGHandlerPrtcl = handler
        let nextHandlerId = await nextHandlerId
        await handler.id.change { $0 = nextHandlerId }
        
        /// add handler
        var handlerPosition: Int = 0
        let correctLevel: Int = priority >= 0 ? priority : 0
        if await handlersGroup.value.count > correctLevel {
            await self.handlersGroup.change { $0[correctLevel].append(handler) }
            handlerPosition = await handlersGroup.value[correctLevel].count - 1
        } else {
            await handlersGroup.change { $0.append([handler]) }
            handlerPosition = await handlersGroup.value[handlersGroup.value.count - 1].count - 1
        }
        
        /// add handler to index
        if await handlersIndex.value[priority] == nil { await handlersIndex.change { $0[priority] = .init() } }
        let handleId = await handler.id.value
        let handlerPositionSendable = handlerPosition
        await handlersIndex.change { $0[priority]?[handleId] = handlerPositionSendable }
    }

    public func add(_ handler: TGHandlerPrtcl) async {
        await add(handler, priority: 0)
    }

    public func remove(_ handler: TGHandlerPrtcl, from priority: Int?) async {
        let priority: Level = priority ?? 0
        let indexId: IndexId = await handler.id.value
        guard
            let index: [IndexId: Position] = await handlersIndex.value[priority],
            let position: Position = index[indexId]
        else {
            return
        }
        let positionIndex = position - 1
        if 
            await handlersGroup.value[priority].count > positionIndex,
            await handlersGroup.value[priority][positionIndex].id.value == handler.id.value
        {
            await handlersGroup.change { $0[priority].remove(at: positionIndex) }
            await handlersIndex.change { $0[priority]?.removeValue(forKey: indexId) }
        }
    }
    
    public func process(_ updates: [TGUpdate]) async {
        for update in updates {
            await self.processByHandler(update)
        }
    }
    
    private func processByHandler(_ update: TGUpdate) async {
        log.trace("\(dump(update))")
        if await handlersGroup.value.isEmpty { return }
        for i in await 1...handlersGroup.value.count {
            for handler in await handlersGroup.value[handlersGroup.value.count - i] {
                if await handler.check(update: update) {
                    Task.detached(priority: .high) { [log] in
                        do {
                            try await handler.handle(update: update)
                        } catch {
                            log.error("\(BotError(error).localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}
