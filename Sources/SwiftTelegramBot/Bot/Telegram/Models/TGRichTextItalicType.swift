// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An italicized text.

 SeeAlso Telegram Bot API Reference:
 [RichTextItalic](https://core.telegram.org/bots/api#richtextitalic)
 */

public enum TGRichTextItalicType: String, Codable, Sendable {
    case italic = "italic"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextItalicType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}