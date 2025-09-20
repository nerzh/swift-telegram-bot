//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Logging

public protocol TGDefaultDispatcherPrtcl: Equatable, Sendable {
    var name: String { get }
    var bot: TGBot { get }
    var log: Logger { get }
    var id: SendableValue<Int> { get }
    var handlersGroup: HandlersGroupActor { get }
    func remove(_ handler: TGHandlerPrtcl) async
    func remove(handler id: Int) async
    func process(_ updates: [TGUpdate]) async
    func handle() async
}

public actor HandlersGroupActor {
    private var _handlersGroup: [TGHandlerPrtcl] = []
    public var value: [TGHandlerPrtcl] {
        _handlersGroup
    }
    
    func add(_ handler: TGHandlerPrtcl) async {
        let handler: TGHandlerPrtcl = handler
        let id: Int = if let id = await _handlersGroup.last?.id.value {
            id + 1
        } else {
            0
        }
        await handler.id.change { $0 = id }
        _handlersGroup.append(handler)
    }
    
    func remove(_ handler: TGHandlerPrtcl) async {
        for (index, groupHandler) in _handlersGroup.enumerated() {
            if (await handler.id.value) == (await groupHandler.id.value) {
                _handlersGroup.remove(at: index)
                break
            }
        }
    }
    
    func remove(handler id: Int) async {
        for (index, groupHandler) in _handlersGroup.enumerated() {
            if id == (await groupHandler.id.value) {
                _handlersGroup.remove(at: index)
                break
            }
        }
    }
}

public extension TGDefaultDispatcherPrtcl {
    var name: String { String(describing: Self.self) }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
    
    func add(_ handler: TGHandlerPrtcl) async {
        await handlersGroup.add(handler)
    }
    
    func remove(_ handler: TGHandlerPrtcl) async {
        await handlersGroup.remove(handler)
    }
    
    func remove(handler id: Int) async {
        await handlersGroup.remove(handler: id)
    }
    
    func process(_ updates: [TGUpdate]) async {
        for update in updates {
            if await handlersGroup.value.isEmpty { return }
            for handler in await handlersGroup.value {
                if await handler.check(update: update) {
                    Task.detached {
                        do {
                            try await handler.handle(update: update)
                        } catch {
                            self.log.error("\(BotError(error).localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}

open class TGDefaultDispatcher: TGDefaultDispatcherPrtcl, @unchecked Sendable {
    public unowned let bot: TGBot
    public let log: Logger
    public let id: SendableValue<Int> = .init(0)
    public let handlersGroup: HandlersGroupActor = .init()
    private let tasks: SendableValue<[UUID: Task<Void, Never>]> = .init([:])

    public init(bot: TGBot, logger: Logger) {
        self.bot = bot
        self.log = logger
    }
    
    open func handle() async {
        fatalError("""
        You must override the handle() method in your Dispatcher. All handlers must be added inside it.
        
        For example:
        
        override 
        func handle() async {
            await add(TGBaseHandler({ update in
                guard let message = update.message else { return }
                let params: TGSendMessageParams = .init(chatId: .chat(message.chat.id), text: "TGBaseHandler")
                try await self.bot.sendMessage(params: params)
            }))
        }
        
        """)
    }
    
    open func process(_ updates: [TGUpdate]) async {
        for update in updates {
            log.trace("processByHandler start:\n\(dump(update))")
            if await handlersGroup.value.isEmpty { return }
            for handler in await handlersGroup.value {
                if await handler.check(update: update) {
                    await tasks.change {
                        let uuid: UUID = UUID()
                        $0[uuid] = Task.detached { [weak self] in
                            if Task.isCancelled { return }
                            guard let self = self else { return }
                            do {
                                try await handler.handle(update: update)
                            } catch {
                                self.log.error("\(BotError(error).localizedDescription)")
                            }
                            await self.tasks.change {
                                $0.removeValue(forKey: uuid)
                            }
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


