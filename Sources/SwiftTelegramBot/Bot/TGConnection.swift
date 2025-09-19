//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Logging

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
    private let task: SendableValue<Task<Void, Never>> = .init(.init {})
    
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
        await task.change { 
            $0 = Task.detached { [weak self] in
                while !Task.isCancelled {
                    guard let self = self else { break }
                    do {
                        let updates: [TGUpdate] = try await self.getUpdates(bot: bot)
                        await bot.processing(updates: updates)
                    } catch {
                        self.log.error("\(BotError(error).localizedDescription)")
                    }
                }
            }
        }
        
        return true
    }
    
    @discardableResult
    public func stop(bot: TGBot) async throws -> Bool {
        await task.value.cancel()
        return true
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
