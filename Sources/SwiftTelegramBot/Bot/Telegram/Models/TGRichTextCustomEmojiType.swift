// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A custom emoji.

 SeeAlso Telegram Bot API Reference:
 [RichTextCustomEmoji](https://core.telegram.org/bots/api#richtextcustomemoji)
 */

public enum TGRichTextCustomEmojiType: String, Codable, Sendable {
    case customEmoji = "custom_emoji"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextCustomEmojiType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}