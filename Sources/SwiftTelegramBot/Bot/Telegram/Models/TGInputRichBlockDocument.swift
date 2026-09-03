// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a general file, corresponding to the custom HTML tag <tg-document>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockDocument](https://core.telegram.org/bots/api#inputrichblockdocument)
 **/
public final class TGInputRichBlockDocument: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockDocument` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case document = "document"
        case caption = "caption"
    }

    /// Type of the block, always “document”
    public let type: TGInputRichBlockDocumentType

    /// The document. Caption is ignored.
    public let document: TGInputMediaDocument

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockDocumentType, document: TGInputMediaDocument, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.document = document
        self.caption = caption
    }
}
