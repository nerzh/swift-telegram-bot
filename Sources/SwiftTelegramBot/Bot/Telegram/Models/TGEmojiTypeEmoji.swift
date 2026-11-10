// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A regular emoji.

 SeeAlso Telegram Bot API Reference:
 [EmojiTypeEmoji](https://core.telegram.org/bots/api#emojitypeemoji)
 **/
public final class TGEmojiTypeEmoji: Codable, Sendable {

    /// Custom keys for coding/decoding `EmojiTypeEmoji` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case emoji = "emoji"
    }

    /// Type of the emoji, always “emoji”
    public let type: TGEmojiTypeEmojiType

    /// The emoji
    public let emoji: String

    public init (type: TGEmojiTypeEmojiType, emoji: String) {
        self.type = type
        self.emoji = emoji
    }
}
