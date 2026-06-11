// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An italicized text.

 SeeAlso Telegram Bot API Reference:
 [RichTextItalic](https://core.telegram.org/bots/api#richtextitalic)
 **/
public final class TGRichTextItalic: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextItalic` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “italic”
    public let type: TGRichTextItalicType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextItalicType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
