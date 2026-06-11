// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A custom emoji.

 SeeAlso Telegram Bot API Reference:
 [RichTextCustomEmoji](https://core.telegram.org/bots/api#richtextcustomemoji)
 **/
public final class TGRichTextCustomEmoji: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextCustomEmoji` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case customEmojiId = "custom_emoji_id"
        case alternativeText = "alternative_text"
    }

    /// Type of the rich text, always “custom_emoji”
    public let type: TGRichTextCustomEmojiType

    /// Unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker.
    public let customEmojiId: String

    /// Alternative emoji for the custom emoji
    public let alternativeText: String

    public init (type: TGRichTextCustomEmojiType, customEmojiId: String, alternativeText: String) {
        self.type = type
        self.customEmojiId = customEmojiId
        self.alternativeText = alternativeText
    }
}
