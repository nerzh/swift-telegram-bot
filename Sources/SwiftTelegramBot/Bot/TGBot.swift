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
    private var _dispatchGroups: [TGDefaultDispatcher] = []
    public var dispatchers: [TGDefaultDispatcher] {
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
    
    public func add(dispatcher: TGDefaultDispatcher.Type...) throws {
        if started {
            throw BotError("Bot already started. Please add dispatchers before start")
        }
        for dispatcherType in dispatcher {
            _dispatchGroups.append(dispatcherType.init(bot: self, logger: log))
        }
    }
    
    public func remove<T: TGDefaultDispatcher>(dispatcher: T) {
        _dispatchGroups.removeAll(where: { $0 == dispatcher })
    }
    
    public func processing(updates: [TGUpdate]) async throws {
        log.trace("processing: Get new updates: \(updates.count)")
        for dispatch in dispatchers {
            await dispatch.process(updates)
        }
        log.trace("processing: send all updates to dispatchers")
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        if started {
            throw BotError("Bot already started")
        }
        started = true
        for dispatch in dispatchers {
            await dispatch.handle()
        }
        return try await connection.start(bot: self)
    }
    
    @discardableResult
    public func stop() async throws -> Bool {
        try await connection.stop(bot: self)
    }
}


