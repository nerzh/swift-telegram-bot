// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a general file, corresponding to the custom HTML tag <tg-document>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockDocument](https://core.telegram.org/bots/api#richblockdocument)
 **/
public final class TGRichBlockDocument: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockDocument` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case document = "document"
        case caption = "caption"
    }

    /// Type of the block, always “document”
    public let type: TGRichBlockDocumentType

    /// The document
    public let document: TGDocument

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockDocumentType, document: TGDocument, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.document = document
        self.caption = caption
    }
}
