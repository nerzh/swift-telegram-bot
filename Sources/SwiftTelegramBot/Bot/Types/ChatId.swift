//
//  ChatId.swift
//  App
//
//  Created by Givi Pataridze on 02.03.2018.
//

import Foundation

/// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
public enum TGChatId: Codable, Sendable {

    case chat(Int64)
    case username(String)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .username(let string):
            try container.encode(string)
        case .chat(let integer):
            try container.encode(integer)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Int64.self) {
            self = .chat(value)
            return
        }
        if let value = try? container.decode(String.self) {
            self = .username(value)
            return
        }
        throw DecodingError.typeMismatch(
            TGChatId.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Expected an integer chat ID or a string username."
            )
        )
    }
}
