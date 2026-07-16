// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an anchor, corresponding to the HTML tag <a> with the attribute name.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockAnchor](https://core.telegram.org/bots/api#inputrichblockanchor)
 **/
public final class TGInputRichBlockAnchor: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockAnchor` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
    }

    /// Type of the block, always “anchor”
    public let type: TGInputRichBlockAnchorType

    /// The name of the anchor
    public let name: String

    public init (type: TGInputRichBlockAnchorType, name: String) {
        self.type = type
        self.name = name
    }
}
