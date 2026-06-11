// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An underlined text.

 SeeAlso Telegram Bot API Reference:
 [RichTextUnderline](https://core.telegram.org/bots/api#richtextunderline)
 */

public enum TGRichTextUnderlineType: String, Codable, Sendable {
    case underline = "underline"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextUnderlineType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}