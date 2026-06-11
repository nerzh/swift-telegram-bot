// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an anchor, corresponding to the HTML tag <a> with the attribute name.

 SeeAlso Telegram Bot API Reference:
 [RichBlockAnchor](https://core.telegram.org/bots/api#richblockanchor)
 **/
public final class TGRichBlockAnchor: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockAnchor` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
    }

    /// Type of the block, always “anchor”
    public let type: TGRichBlockAnchorType

    /// The name of the anchor
    public let name: String

    public init (type: TGRichBlockAnchorType, name: String) {
        self.type = type
        self.name = name
    }
}
