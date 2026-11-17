//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Logging

#if canImport(ServiceLifecycle)
import ServiceLifecycle
#endif

public protocol TGConnectionPrtcl: Sendable {
    @discardableResult
    func start(bot: TGBot) async throws -> Bool
    
    @discardableResult
    func stop(bot: TGBot) async throws -> Bool
}

public enum TGConnectionType: Sendable {
    case longpolling(limit: Int? = nil,
                     timeout: Int? = nil,
                     allowedUpdates: [TGUpdate.CodingKeys]? = nil)
    case webhook(webHookURL: URL)
}

public final class TGLongPollingConnection: TGConnectionPrtcl {
    private let limit: Int?
    private let timeout: Int?
    public let allowedUpdates: [TGUpdate.CodingKeys]?
    
    private let offsetUpdates: SendableValue<Int> = .init(0)
    private let log: Logger
    private let task: SendableValue<Task<Void, Never>?> = .init(nil)
    
    public init(limit: Int? = nil,
                timeout: Int? = 10,
                allowedUpdates: [TGUpdate.CodingKeys]? = nil,
                log: Logger
    ) {
        self.log = log
        self.limit = limit
        self.timeout = timeout ?? 10
        self.allowedUpdates = allowedUpdates
    }
    
    @discardableResult
    public func start(bot: TGBot) async throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        try await bot.deleteWebhook(params: deleteWebHookParams)

        let previousTask = await task.value
        await task.change {
            $0 = Task { [weak self] in await self?.runPolling(bot: bot) }
        }

        previousTask?.cancel()
        if let previousTask {
            await previousTask.value
        }
        
        return true
    }
    
    @discardableResult
    public func stop(bot: TGBot) async throws -> Bool {
        let currentTask = await task.value
        await task.change {
            $0 = nil
        }
        currentTask?.cancel()
        if let currentTask {
            await currentTask.value
        }
        return true
    }

    private var shouldContinuePolling: Bool {
#if canImport(ServiceLifecycle)
        !Task.isCancelled && !Task.isShuttingDownGracefully
#else
        !Task.isCancelled
#endif
    }

    private func runPolling(bot: TGBot) async {
        while shouldContinuePolling {
            do {
                let updates: [TGUpdate] = try await getUpdates(bot: bot)
                guard shouldContinuePolling else { return }
                await bot.processing(updates: updates)
            } catch is CancellationError {
                return
            } catch {
                log.error("\(BotError(error).localizedDescription)")
                guard await waitBeforeRetry() else { return }
            }
        }
    }
    
    private func waitBeforeRetry() async -> Bool {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return shouldContinuePolling
        } catch {
            return false
        }
    }
    
    private func getUpdates(bot: TGBot) async throws -> [TGUpdate] {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let newOffset: Int? = await offsetUpdates.value == 0 ? nil : await offsetUpdates.value
        let params: TGGetUpdatesParams = .init(offset: newOffset,
                                               limit: limit,
                                               timeout: timeout,
                                               allowedUpdates: allowedUpdates)
        let response = try await bot.getUpdates(params: params)
        if let lastUpdate: TGUpdate = response.last {
            await offsetUpdates.change { $0 = lastUpdate.updateId + 1 }
        }
        return response
    }
}


public final class TGWebHookConnection: TGConnectionPrtcl {
    
    public let webHookURL: URL
    
    public init(webHookURL: URL) {
        self.webHookURL = webHookURL
    }
    
    @discardableResult
    public func start(bot: TGBot) async throws -> Bool {
        let webHookParams: TGSetWebhookParams = .init(url: webHookURL.description)
        return try await bot.setWebhook(params: webHookParams)
    }
    
    @discardableResult
    public func stop(bot: TGBot) async throws -> Bool {
        let deleteWebHookParams: TGDeleteWebhookParams = .init(dropPendingUpdates: false)
        return try await bot.deleteWebhook(params: deleteWebHookParams)
    }
}
