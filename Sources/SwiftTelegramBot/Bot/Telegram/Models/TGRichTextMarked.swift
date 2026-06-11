// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A marked text.

 SeeAlso Telegram Bot API Reference:
 [RichTextMarked](https://core.telegram.org/bots/api#richtextmarked)
 **/
public final class TGRichTextMarked: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextMarked` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “marked”
    public let type: TGRichTextMarkedType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextMarkedType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
