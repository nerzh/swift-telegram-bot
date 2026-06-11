// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A strikethrough text.

 SeeAlso Telegram Bot API Reference:
 [RichTextStrikethrough](https://core.telegram.org/bots/api#richtextstrikethrough)
 **/
public final class TGRichTextStrikethrough: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextStrikethrough` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “strikethrough”
    public let type: TGRichTextStrikethroughType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextStrikethroughType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
