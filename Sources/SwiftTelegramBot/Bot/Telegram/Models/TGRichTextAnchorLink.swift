// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A link to an anchor.

 SeeAlso Telegram Bot API Reference:
 [RichTextAnchorLink](https://core.telegram.org/bots/api#richtextanchorlink)
 **/
public final class TGRichTextAnchorLink: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextAnchorLink` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case anchorName = "anchor_name"
    }

    /// Type of the rich text, always “anchor_link”
    public let type: TGRichTextAnchorLinkType

    /// The link text
    public let text: TGRichText

    /// The name of the anchor. If the name is empty, then the link brings back to the top of the message.
    public let anchorName: String

    public init (type: TGRichTextAnchorLinkType, text: TGRichText, anchorName: String) {
        self.type = type
        self.text = text
        self.anchorName = anchorName
    }
}
