// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A superscript text.

 SeeAlso Telegram Bot API Reference:
 [RichTextSuperscript](https://core.telegram.org/bots/api#richtextsuperscript)
 **/
public final class TGRichTextSuperscript: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextSuperscript` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “superscript”
    public let type: TGRichTextSuperscriptType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextSuperscriptType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
