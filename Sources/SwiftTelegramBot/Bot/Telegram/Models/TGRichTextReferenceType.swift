// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A reference.

 SeeAlso Telegram Bot API Reference:
 [RichTextReference](https://core.telegram.org/bots/api#richtextreference)
 */

public enum TGRichTextReferenceType: String, Codable, Sendable {
    case reference = "reference"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextReferenceType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}