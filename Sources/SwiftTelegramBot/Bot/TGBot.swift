//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Logging
import SwiftExtensionsPack

public actor TGBot {

    public static let standardTGURL: URL = .init(
        string: "https://api.telegram.org"
    )!

    public let connectionType: TGConnectionType
    public let botId: String
    public let tgURI: URL
    public var tgClient: TGClientPrtcl {
        get async { client }
    }
    public let log: Logger
    private let connection: TGConnectionPrtcl
    private let client: TGClientPrtcl
    private var _dispatchGroups: [any TGDefaultDispatcherPrtcl] = []
    public var dispatchers: [any TGDefaultDispatcherPrtcl] {
        get { _dispatchGroups }
    }
    
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
        let requestLimit: UInt?

        switch connectionType {
        case let .longpolling(limit, timeout, allowedUpdates):
            requestLimit = apiRequestLimitLongPolling
            self.connection = TGLongPollingConnection(
                limit: limit,
                timeout: timeout,
                allowedUpdates: allowedUpdates,
                log: log
            )
        case let .webhook(webHookURL):
            requestLimit = apiRequestLimitWebHook
            self.connection = TGWebHookConnection(webHookURL: webHookURL)
        }

        if let requestLimit {
            let limiter = LimiterAsync(maxRequests: Int(clamping: requestLimit), per: 1)
            client = TGRateLimitedClient(client: tgClient, limiter: limiter)
        } else {
            client = tgClient
        }

        self.botId = botId
        self.tgURI = tgURI
        self.log = log
    }
    
    func getMethodURL(_ methodName: String) -> String {
        "\(tgURI)/bot\(botId)/\(methodName)"
    }
    
    public func add(dispatcher: any TGDefaultDispatcherPrtcl) async throws {
        await dispatcher.handle()
        _dispatchGroups.append(dispatcher)
    }
    
    public func add(_ dispatchers: any TGDefaultDispatcherPrtcl...) async throws {
        for dispatcher in dispatchers {
            try await add(dispatcher: dispatcher)
        }
    }
    
    public func remove<T: TGDefaultDispatcherPrtcl>(dispatcher: T) {
        _dispatchGroups.removeAll { existing in
            guard let candidate = existing as? T else { return false }
            return candidate == dispatcher
        }
    }
    
    public func processing(updates: [TGUpdate]) async {
        for dispatch in dispatchers {
            await dispatch.process(updates)
        }
    }
    
    @discardableResult
    public func start() async throws -> Bool {
        try await connection.start(bot: self)
    }
    
    @discardableResult
    public func stop() async throws -> Bool {
        try await connection.stop(bot: self)
    }
}


