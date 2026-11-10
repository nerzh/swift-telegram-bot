// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A custom emoji.

 SeeAlso Telegram Bot API Reference:
 [EmojiTypeCustomEmoji](https://core.telegram.org/bots/api#emojitypecustomemoji)
 **/
public final class TGEmojiTypeCustomEmoji: Codable, Sendable {

    /// Custom keys for coding/decoding `EmojiTypeCustomEmoji` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case customEmojiId = "custom_emoji_id"
    }

    /// Type of the emoji, always “custom_emoji”
    public let type: TGEmojiTypeCustomEmojiType

    /// Identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker.
    public let customEmojiId: String

    public init (type: TGEmojiTypeCustomEmojiType, customEmojiId: String) {
        self.type = type
        self.customEmojiId = customEmojiId
    }
}
