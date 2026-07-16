// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A collage, corresponding to the custom HTML tag <tg-collage>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockCollage](https://core.telegram.org/bots/api#inputrichblockcollage)
 **/
public final class TGInputRichBlockCollage: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockCollage` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case blocks = "blocks"
        case caption = "caption"
    }

    /// Type of the block, always “collage”
    public let type: TGInputRichBlockCollageType

    /// Elements of the collage
    public let blocks: [TGInputRichBlock]

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockCollageType, blocks: [TGInputRichBlock], caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.blocks = blocks
        self.caption = caption
    }
}
