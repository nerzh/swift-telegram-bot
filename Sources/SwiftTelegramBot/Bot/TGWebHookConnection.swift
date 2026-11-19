import Foundation
import class SwiftExtensionsPack.SafeValue

public final class TGWebHookConnection: TGConnectionPrtcl {
    public let webHookURL: URL

    private enum Change { case register, remove }

    private struct Registration {
        weak var bot: TGBot?
        var registered = false
        var pending: (change: Change, task: Task<Bool, Error>)?
    }

    private enum Request {
        case alreadyStarted
        case existingRemoval(Task<Bool, Error>)
        case new(Task<Bool, Error>)
    }

    // A public connection can be used with more than one bot.
    private let registrations = SafeValue<[ObjectIdentifier: Registration]>([:])

    public init(webHookURL: URL) {
        self.webHookURL = webHookURL
    }

    @discardableResult
    nonisolated(nonsending)
    public func start(bot: TGBot) async throws -> Bool {
        try await changeWebhook(.register, bot: bot)
    }

    @discardableResult
    nonisolated(nonsending)
    public func stop(bot: TGBot) async throws -> Bool {
        try await changeWebhook(.remove, bot: bot)
    }

    nonisolated(nonsending)
    private func changeWebhook(_ change: Change, bot: TGBot) async throws -> Bool {
        let id = ObjectIdentifier(bot)
        let request = registrations.change { bots -> Request in
            if bots[id]?.bot == nil {
                bots = bots.filter { $0.value.bot != nil }
                bots[id] = Registration(bot: bot)
            }
            let previous = bots[id]?.pending
            if let previous, previous.change == change {
                switch change {
                case .register: return .alreadyStarted
                case .remove: return .existingRemoval(previous.task)
                }
            }

            // Reserve the next change before suspending. A new setWebhook must wait
            // for any preceding deleteWebhook to finish.
            let task = Task {
                _ = await previous?.task.result
                try Task.checkCancellation()
                return try await self.send(change, bot: bot)
            }
            bots[id]?.pending = (change, task)
            return .new(task)
        }

        switch request {
        case .alreadyStarted:
            throw BotError("Bot already started")
        case .existingRemoval(let task):
            return try await task.value
        case .new(let task):
            defer {
                registrations.change { bots in
                    guard bots[id]?.pending?.task == task else { return }
                    if bots[id]?.registered == true {
                        bots[id]?.pending = nil
                    } else {
                        bots[id] = nil
                    }
                }
            }
            return try await withTaskCancellationHandler(
                operation: { try await task.value },
                onCancel: { task.cancel() }
            )
        }
    }

    private func send(_ change: Change, bot: TGBot) async throws -> Bool {
        let id = ObjectIdentifier(bot)
        switch change {
        case .register:
            guard registrations.value[id]?.registered != true else { throw BotError("Bot already started") }
            let registered = try await bot.setWebhook(params: .init(url: webHookURL.description))
            registrations.change { $0[id]?.registered = registered }
            return registered
        case .remove:
            let removed = try await bot.deleteWebhook(params: .init(dropPendingUpdates: false))
            if removed { registrations.change { $0[id]?.registered = false } }
            return removed
        }
    }
}
