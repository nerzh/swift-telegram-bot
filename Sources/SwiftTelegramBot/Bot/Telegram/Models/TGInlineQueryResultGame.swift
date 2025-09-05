// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a Game.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultGame](https://core.telegram.org/bots/api#inlinequeryresultgame)
 **/
public final class TGInlineQueryResultGame: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultGame` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case gameShortName = "game_short_name"
        case replyMarkup = "reply_markup"
    }

    /// Type of the result, must be game
    public let type: TGInlineQueryResultGameType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// Short name of the game
    public let gameShortName: String

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    public init (type: TGInlineQueryResultGameType, id: String, gameShortName: String, replyMarkup: TGInlineKeyboardMarkup? = nil) {
        self.type = type
        self.id = id
        self.gameShortName = gameShortName
        self.replyMarkup = replyMarkup
    }
}
