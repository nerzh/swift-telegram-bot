// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A bold text.

 SeeAlso Telegram Bot API Reference:
 [RichTextBold](https://core.telegram.org/bots/api#richtextbold)
 */

public enum TGRichTextBoldType: String, Codable, Sendable {
    case bold = "bold"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextBoldType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}