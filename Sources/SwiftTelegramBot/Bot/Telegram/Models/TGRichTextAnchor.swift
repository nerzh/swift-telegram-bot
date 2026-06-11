// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An anchor.

 SeeAlso Telegram Bot API Reference:
 [RichTextAnchor](https://core.telegram.org/bots/api#richtextanchor)
 **/
public final class TGRichTextAnchor: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextAnchor` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
    }

    /// Type of the rich text, always “anchor”
    public let type: TGRichTextAnchorType

    /// The name of the anchor
    public let name: String

    public init (type: TGRichTextAnchorType, name: String) {
        self.type = type
        self.name = name
    }
}
