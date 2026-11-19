//
//  BotError
//  Telegrammer
//
//  Created by Givi Pataridze on 21.04.2018.
//

import Foundation

public struct BotError: ErrorCommon {
    
    public var title: String = ""
    
    public enum `Type`: String, Decodable, Sendable {
        case `internal`
        case network
        case server
    }

    public let type: Type
    public let description: String
    public var reason: String
    public private(set) var httpStatusCode: Int?
    public private(set) var errorCode: Int?
    public private(set) var parameters: TGResponseParameters?
    
    public init() {
        self.type = .internal
        self.description = "\(Self.self)"
        self.reason = "\(Self.self)"
    }
    
    public init(reason: String) {
        self.reason = reason
        self.type = .internal
        self.description = "\(Self.self)"
    }
    
    public init(_ reason: String) {
        self.reason = reason
        self.type = .internal
        self.description = "\(Self.self)"
    }
    
    public init(_ error: Error) {
        if let botError = error as? BotError {
            self = botError
            return
        }
        self.reason = error.localizedDescription
        self.type = .internal
        self.description = "\(Self.self)"
    }
    
    public init(type: Type, description: String = "<No description provided>", reason: String = "<No reason provided>") {
        self.type = type
        self.description = description
        self.reason = reason
    }

    init(httpStatusCode: Int, errorCode: Int? = nil, parameters: TGResponseParameters? = nil, reason: String) {
        let telegramCode = errorCode.map { " (Telegram \($0))" } ?? ""
        self.init(type: .server, description: "HTTP \(httpStatusCode)\(telegramCode): \(reason)", reason: reason)
        self.httpStatusCode = httpStatusCode
        self.errorCode = errorCode
        self.parameters = parameters
    }

    init<T>(httpStatusCode: Int, container: TGTelegramContainer<T>) {
        self.init(httpStatusCode: httpStatusCode, errorCode: container.errorCode,
                  parameters: container.parameters, reason: container.description ?? "Telegram API request failed.")
    }

    public var localizedDescription: String {
        return """

        >>>Type: \(type)
        >>>Description: \(description)
        >>>Reason: \(reason)

        """
    }
}
