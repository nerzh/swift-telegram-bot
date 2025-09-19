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
    private var _dispatchGroups: [any TGDefaultDispatcherPrtcl] = []
    public var dispatchers: [any TGDefaultDispatcherPrtcl] {
        get { _dispatchGroups }
    }
    private var started: Bool = false
    
    public init(
        connectionType: TGConnectionType,
        tgClient: TGClientPrtcl,
        tgURI: URL = TGBot.standardTGURL,
        botId: String,
        apiRequestLimitWebHook: UInt? = 30,
        apiRequestLimitLongPolling: UInt? = 5,
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
        self.botId = botId
        self.tgURI = tgURI
        self.log = log
    }
    
    func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
    
    public func add(dispatcher: any TGDefaultDispatcherPrtcl) async throws {
        if started {
            throw BotError("Bot already started. Please add dispatchers before start")
        }
        await dispatcher.handle()
        _dispatchGroups.append(dispatcher)
    }
    
    public func add(_ dispatchers: any TGDefaultDispatcherPrtcl...) async throws {
        for dispatcher in dispatchers {
            try await add(dispatcher: dispatcher)
        }
    }
    
    public func remove<T: TGDefaultDispatcherPrtcl>(dispatcher: T) {
        _dispatchGroups.removeAll(where: { $0 as! T == dispatcher })
    }
    
    public func processing(updates: [TGUpdate]) async {
        for dispatch in dispatchers {
            await dispatch.process(updates)
        }
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        if started {
            throw BotError("Bot already started")
        }
        started = true
        return try await connection.start(bot: self)
    }
    
    @discardableResult
    public func stop() async throws -> Bool {
        try await connection.stop(bot: self)
    }
}


