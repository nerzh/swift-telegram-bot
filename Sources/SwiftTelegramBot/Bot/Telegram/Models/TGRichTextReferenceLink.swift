// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A link to a reference.

 SeeAlso Telegram Bot API Reference:
 [RichTextReferenceLink](https://core.telegram.org/bots/api#richtextreferencelink)
 **/
public final class TGRichTextReferenceLink: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextReferenceLink` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case referenceName = "reference_name"
    }

    /// Type of the rich text, always “reference_link”
    public let type: TGRichTextReferenceLinkType

    /// The link text
    public let text: TGRichText

    /// The name of the reference
    public let referenceName: String

    public init (type: TGRichTextReferenceLinkType, text: TGRichText, referenceName: String) {
        self.type = type
        self.text = text
        self.referenceName = referenceName
    }
}
