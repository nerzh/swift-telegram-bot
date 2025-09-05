// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The reaction is based on a custom emoji.

 SeeAlso Telegram Bot API Reference:
 [ReactionTypeCustomEmoji](https://core.telegram.org/bots/api#reactiontypecustomemoji)
 **/
public final class TGReactionTypeCustomEmoji: Codable, Sendable {

    /// Custom keys for coding/decoding `ReactionTypeCustomEmoji` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case customEmojiId = "custom_emoji_id"
    }

    /// Type of the reaction, always “custom_emoji”
    public let type: TGReactionTypeCustomEmojiType

    /// Custom emoji identifier
    public let customEmojiId: String

    public init (type: TGReactionTypeCustomEmojiType, customEmojiId: String) {
        self.type = type
        self.customEmojiId = customEmojiId
    }
}
