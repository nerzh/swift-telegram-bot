// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A collage, corresponding to the custom HTML tag <tg-collage>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockCollage](https://core.telegram.org/bots/api#richblockcollage)
 **/
public final class TGRichBlockCollage: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockCollage` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case blocks = "blocks"
        case caption = "caption"
    }

    /// Type of the block, always “collage”
    public let type: TGRichBlockCollageType

    /// Elements of the collage
    public let blocks: [TGRichBlock]

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockCollageType, blocks: [TGRichBlock], caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.blocks = blocks
        self.caption = caption
    }
}
