// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a Game.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultGame](https://core.telegram.org/bots/api#inlinequeryresultgame)
 */

public enum TGInlineQueryResultGameType: String, Codable, Sendable {
    case game = "game"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultGameType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}