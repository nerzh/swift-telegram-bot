// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mention of a Telegram user by their identifier.

 SeeAlso Telegram Bot API Reference:
 [RichTextTextMention](https://core.telegram.org/bots/api#richtexttextmention)
 */

public enum TGRichTextTextMentionType: String, Codable, Sendable {
    case textMention = "text_mention"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextTextMentionType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}