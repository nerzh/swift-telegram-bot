// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A reference.

 SeeAlso Telegram Bot API Reference:
 [RichTextReference](https://core.telegram.org/bots/api#richtextreference)
 **/
public final class TGRichTextReference: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextReference` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case name = "name"
    }

    /// Type of the rich text, always “reference”
    public let type: TGRichTextReferenceType

    /// Text of the reference
    public let text: TGRichText

    /// The name of the reference
    public let name: String

    public init (type: TGRichTextReferenceType, text: TGRichText, name: String) {
        self.type = type
        self.text = text
        self.name = name
    }
}
