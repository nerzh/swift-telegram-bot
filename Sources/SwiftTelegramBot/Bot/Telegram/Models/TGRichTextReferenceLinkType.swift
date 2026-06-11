// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A link to a reference.

 SeeAlso Telegram Bot API Reference:
 [RichTextReferenceLink](https://core.telegram.org/bots/api#richtextreferencelink)
 */

public enum TGRichTextReferenceLinkType: String, Codable, Sendable {
    case referenceLink = "reference_link"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextReferenceLinkType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}