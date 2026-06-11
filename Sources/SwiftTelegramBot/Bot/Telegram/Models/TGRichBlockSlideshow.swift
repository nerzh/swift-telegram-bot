// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A slideshow, corresponding to the custom HTML tag <tg-slideshow>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockSlideshow](https://core.telegram.org/bots/api#richblockslideshow)
 **/
public final class TGRichBlockSlideshow: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockSlideshow` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case blocks = "blocks"
        case caption = "caption"
    }

    /// Type of the block, always “slideshow”
    public let type: TGRichBlockSlideshowType

    /// Elements of the slideshow
    public let blocks: [TGRichBlock]

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockSlideshowType, blocks: [TGRichBlock], caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.blocks = blocks
        self.caption = caption
    }
}
