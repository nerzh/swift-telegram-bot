//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 29.05.2021.
//

import Foundation
import Logging

public protocol TGConnectionPrtcl: Sendable {
    @discardableResult
    func start(bot: TGBot) async throws -> Bool
}

public enum TGConnectionType: Sendable {
    case longpolling(limit: Int?,
                     timeout: Int?,
                     allowedUpdates: [TGUpdate.CodingKeys]?)
    case webhook(webHookURL: URL)
}

public final class TGLongPollingConnection: TGConnectionPrtcl {
    private let limit: Int?
    private let timeout: Int?
    public let allowedUpdates: [TGUpdate.CodingKeys]?
    
    private let offsetUpdates: SendableValue<Int> = .init(0)
    private var newOffsetUpdates: Int {
        get async {
            await offsetUpdates.change { $0 += 1 }
        }
    }
    private let log: Logger
    
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
        Task.detached { [weak self] in
            while !Task.isCancelled {
                guard let self = self else { break }
                do {
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    let updates: [TGUpdate] = try await self.getUpdates(bot: bot)
                    await bot.dispatcher.process(updates)
                } catch {
                    self.log.error("\(BotError(error).localizedDescription)")
                }
            }
        }
        
        return true
    }
    
    private func getUpdates(bot: TGBot) async throws -> [TGUpdate] {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let params: TGGetUpdatesParams = .init(offset: await newOffsetUpdates,
                                               limit: limit,
                                               timeout: timeout,
                                               allowedUpdates: allowedUpdates)
        let response = try await bot.getUpdates(params: params)
        if let lastUpdate: TGUpdate = response.last {
            await offsetUpdates.change { $0 = lastUpdate.updateId }
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
}
