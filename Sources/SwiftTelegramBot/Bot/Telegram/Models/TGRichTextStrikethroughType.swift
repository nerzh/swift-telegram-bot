// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A strikethrough text.

 SeeAlso Telegram Bot API Reference:
 [RichTextStrikethrough](https://core.telegram.org/bots/api#richtextstrikethrough)
 */

public enum TGRichTextStrikethroughType: String, Codable, Sendable {
    case strikethrough = "strikethrough"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextStrikethroughType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}