//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Logging

open class TGDefaultDispatcher: Equatable, @unchecked Sendable {
    public var name: String { String(describing: Self.self) }
    public unowned let bot: TGBot
    public let log: Logger
    public let handlersGroup: SendableValue<[[TGHandlerPrtcl]]> = .init([])
    private let handlersId: SendableValue<Int> = .init(0)
    private var nextHandlerId: Int {
        get async {
            await handlersId.change { $0 += 1 }
        }
    }
    
    private typealias Level = Int
    private typealias IndexId = Int
    private typealias Position = Int
    private let handlersIndex: SendableValue<[Level: [IndexId: Position]]> = .init([:])
    private let tasks: SendableValue<[UUID: Task<Void, Never>]> = .init([:])
    
    public static func == (lhs: TGDefaultDispatcher, rhs: TGDefaultDispatcher) -> Bool {
        lhs.name == rhs.name
    }

    public required init(bot: TGBot, logger: Logger) {
        self.bot = bot
        self.log = logger
    }
    
    open func handle() async {}

    open func add(_ handler: TGHandlerPrtcl, priority: Int) async {
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

    open func add(_ handler: TGHandlerPrtcl) async {
        await add(handler, priority: 0)
    }

    open func remove(_ handler: TGHandlerPrtcl, from priority: Int?) async {
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
    
    open func process(_ updates: [TGUpdate]) async {
        log.trace("dispatcher send to processing: \(updates.count) updates")
        for update in updates {
            await self.processByHandler(update)
        }
        log.trace("dispatcher finish send processing: \(updates.count) updates")
    }
    
    private func processByHandler(_ update: TGUpdate) async {
        log.trace("processByHandler start")
        log.trace("\(dump(update))")
        if await handlersGroup.value.isEmpty { return }
        for i in await 1...handlersGroup.value.count {
            for handler in await handlersGroup.value[handlersGroup.value.count - i] {
                if await handler.check(update: update) {
                    await tasks.change {
                        let uuid: UUID = UUID()
                        $0[uuid] = Task.detached(priority: .high) { [weak self, uuid] in
                            if Task.isCancelled { return }
                            guard let self = self else { return }
                            log.trace("processByHandler Task start \(uuid)")
                            do {
                                try await handler.handle(update: update)
                            } catch {
                                self.log.error("\(BotError(error).localizedDescription)")
                            }
                            await self.tasks.change {
                                $0.removeValue(forKey: uuid)
                            }
                            log.trace("processByHandler Task finish \(uuid)")
                        }
                    }
                }
            }
        }
    }
    
    deinit {
        let group: DispatchGroup = .init()
        group.enter()
        Task { [weak self] in
            for task in (await self?.tasks.value ?? [:]).values {
                task.cancel()
            }
            group.leave()
        }
        group.wait()
    }
}


