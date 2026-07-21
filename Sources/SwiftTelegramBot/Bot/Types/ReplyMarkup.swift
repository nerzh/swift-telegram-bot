//
//  ReplyMarkup.swift
//  App
//
//  Created by Givi Pataridze on 01.03.2018.
//

//import TelegrammerMultipart

/** Enum for InlineKeyboardMarkup or ReplyKeyboardMarkup or ReplyKeyboardRemove or ForceReply
 
 SeeAlso Telegram TGBot API Reference:
 [Reply Markups](https://core.telegram.org/bots/2-0-intro#new-inline-keyboards)
 */
public enum TGReplyMarkup: Codable, Sendable {
    case inlineKeyboardMarkup(TGInlineKeyboardMarkup)
    case replyKeyboardMarkup(TGReplyKeyboardMarkup)
    case replyKeyboardRemove(TGReplyKeyboardRemove)
    case forceReply(TGForceReply)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .inlineKeyboardMarkup(let value):
            try container.encode(value)
        case .replyKeyboardMarkup(let value):
            try container.encode(value)
        case .replyKeyboardRemove(let value):
            try container.encode(value)
        case .forceReply(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInlineKeyboardMarkup.self) {
            self = .inlineKeyboardMarkup(value)
            return
        }
        if let value = try? container.decode(TGReplyKeyboardMarkup.self) {
            self = .replyKeyboardMarkup(value)
            return
        }
        if let value = try? container.decode(TGReplyKeyboardRemove.self) {
            self = .replyKeyboardRemove(value)
            return
        }
        if let value = try? container.decode(TGForceReply.self) {
            self = .forceReply(value)
            return
        }
        throw DecodingError.typeMismatch(
            TGReplyMarkup.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Expected a supported reply markup object."
            )
        )
    }
}
