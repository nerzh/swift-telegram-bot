//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Logging

public actor TGBot {

    public static let standardTGURL: URL = .init(
        string: "https://api.telegram.org"
    )!

    public let connectionType: TGConnectionType
    public let dispatcher: TGDispatcherPrtcl
    public let botId: String
    public let tgURI: URL
    public var tgClient: TGClientPrtcl {
        get async {
            if let limiter {
                await limiter.run {
                    return await client
                }
            }
            return client
        }
    }
    public let log: Logger
    private let limiter: LimiterAsync?
    private let connection: TGConnectionPrtcl
    private var client: TGClientPrtcl
    public var dispatchGroups: [TGDispatcherPrtcl] = []
    
    public init(
        connectionType: TGConnectionType,
        dispatcher: TGDispatcherPrtcl? = nil,
        tgClient: TGClientPrtcl,
        tgURI: URL = TGBot.standardTGURL,
        botId: String,
        apiRequestLimitWebHook: UInt? = 30,
        apiRequestLimitLongPolling: UInt? = 2,
        log: Logger = .init(label: "com.tgbot")
    ) async throws {
        self.connectionType = connectionType
        switch connectionType {
        case let .longpolling(limit, timeout, allowedUpdates):
            if let apiRequestLimitLongPolling {
                limiter = LimiterAsync(
                    maxRequests: Int(apiRequestLimitLongPolling),
                    per: 1
                )
            } else {
                limiter = nil
            }
            self.connection = TGLongPollingConnection(
                limit: limit,
                timeout: timeout,
                allowedUpdates: allowedUpdates,
                log: log
            )
        case let .webhook(webHookURL):
            if let apiRequestLimitWebHook {
                limiter = LimiterAsync(
                    maxRequests: Int(apiRequestLimitWebHook),
                    per: 1
                )
            } else {
                limiter = nil
            }
            self.connection = TGWebHookConnection(webHookURL: webHookURL)
        }
        client = tgClient
        client.log = log
        self.botId = botId
        self.tgURI = tgURI
        if let dispatcher {
            self.dispatcher = dispatcher
        } else {
            self.dispatcher = try await TGDefaultDispatcher(log: log)
        }
        self.log = log
    }

    public func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }

    @discardableResult
    public func start() async throws -> Bool {
        try await connection.start(bot: self)
    }
}
