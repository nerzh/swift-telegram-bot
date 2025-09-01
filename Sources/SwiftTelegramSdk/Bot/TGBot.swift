//
//  File.swift
//
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Logging

public actor TGBot: TGBotPrtcl {

    public static let standardTGURL: URL = .init(
        string: "https://api.telegram.org"
    )!

    public let connectionType: TGConnectionType
    public let dispatcher: TGDispatcherPrtcl
    public let botId: String
    public let tgURI: URL
    public var tgClient: TGClientPrtcl {
        get async {
//            await limiter.run {
                return self.client
//            }
        }
    }
    public let log: Logger
    private let limiter: LimiterAsync
    private let connection: TGConnectionPrtcl
    private let client: TGClientPrtcl

    public init(
        connectionType: TGConnectionType,
        dispatcher: TGDispatcherPrtcl? = nil,
        tgClient: TGClientPrtcl,
        tgURI: URL = TGBot.standardTGURL,
        botId: String,
        apiRequestLimitWebHook: UInt = 30,
        apiRequestLimitLongPolling: UInt = 2,
        log: Logger = .init(label: "com.tgbot")
    ) async throws {
        self.connectionType = connectionType
        limiter = LimiterAsync(
            maxRequests: Int(apiRequestLimitLongPolling),
            per: 1
        )
        switch connectionType {
        case let .longpolling(limit, timeout, allowedUpdates):
            self.connection = TGLongPollingConnection(
                limit: limit,
                timeout: timeout,
                allowedUpdates: allowedUpdates,
                log: log
            )
        case let .webhook(webHookURL):
            limiter = LimiterAsync(
                maxRequests: Int(apiRequestLimitLongPolling),
                per: 1
            )
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
