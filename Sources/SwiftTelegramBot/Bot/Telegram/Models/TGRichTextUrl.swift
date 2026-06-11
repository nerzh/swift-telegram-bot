// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with a link.

 SeeAlso Telegram Bot API Reference:
 [RichTextUrl](https://core.telegram.org/bots/api#richtexturl)
 **/
public final class TGRichTextUrl: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextUrl` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case url = "url"
    }

    /// Type of the rich text, always “url”
    public let type: TGRichTextUrlType

    /// The text
    public let text: TGRichText

    /// URL of the link
    public let url: String

    public init (type: TGRichTextUrlType, text: TGRichText, url: String) {
        self.type = type
        self.text = text
        self.url = url
    }
}
