// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An underlined text.

 SeeAlso Telegram Bot API Reference:
 [RichTextUnderline](https://core.telegram.org/bots/api#richtextunderline)
 **/
public final class TGRichTextUnderline: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextUnderline` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “underline”
    public let type: TGRichTextUnderlineType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextUnderlineType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
