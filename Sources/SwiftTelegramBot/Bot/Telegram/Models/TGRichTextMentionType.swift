// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mention by a username.

 SeeAlso Telegram Bot API Reference:
 [RichTextMention](https://core.telegram.org/bots/api#richtextmention)
 */

public enum TGRichTextMentionType: String, Codable, Sendable {
    case mention = "mention"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextMentionType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}