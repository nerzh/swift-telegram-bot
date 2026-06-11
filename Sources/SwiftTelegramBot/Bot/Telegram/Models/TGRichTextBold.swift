// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A bold text.

 SeeAlso Telegram Bot API Reference:
 [RichTextBold](https://core.telegram.org/bots/api#richtextbold)
 **/
public final class TGRichTextBold: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextBold` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “bold”
    public let type: TGRichTextBoldType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextBoldType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
