//
//  TelegramContainer.swift
//  App
//
//  Created by Givi Pataridze on 25.02.2018.
//
import Foundation
/// This object represents a Telegram server response container.
public struct TGTelegramContainer<T: Decodable & Sendable>: Decodable & Sendable {

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case result = "result"
        case description = "description"
        case errorCode = "error_code"
        case parameters = "parameters"
    }

    public let ok: Bool
    public let result: T?
    public let description: String?
    public let errorCode: Int?
    public let parameters: TGResponseParameters?

    public init (ok: Bool, result: T?, description: String?, errorCode: Int?, parameters: TGResponseParameters?) {
        self.ok = ok
        self.result = result
        self.description = description
        self.errorCode = errorCode
        self.parameters = parameters
    }
}
