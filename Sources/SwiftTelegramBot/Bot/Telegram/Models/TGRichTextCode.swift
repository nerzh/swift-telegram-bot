// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A monowidth text.

 SeeAlso Telegram Bot API Reference:
 [RichTextCode](https://core.telegram.org/bots/api#richtextcode)
 **/
public final class TGRichTextCode: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextCode` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “code”
    public let type: TGRichTextCodeType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextCodeType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
