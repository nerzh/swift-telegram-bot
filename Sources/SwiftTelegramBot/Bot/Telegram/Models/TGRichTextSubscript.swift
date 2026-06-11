// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A subscript text.

 SeeAlso Telegram Bot API Reference:
 [RichTextSubscript](https://core.telegram.org/bots/api#richtextsubscript)
 **/
public final class TGRichTextSubscript: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextSubscript` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “subscript”
    public let type: TGRichTextSubscriptType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextSubscriptType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
