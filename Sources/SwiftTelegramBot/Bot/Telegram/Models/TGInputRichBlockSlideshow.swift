// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A slideshow, corresponding to the custom HTML tag <tg-slideshow>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockSlideshow](https://core.telegram.org/bots/api#inputrichblockslideshow)
 **/
public final class TGInputRichBlockSlideshow: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockSlideshow` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case blocks = "blocks"
        case caption = "caption"
    }

    /// Type of the block, always “slideshow”
    public let type: TGInputRichBlockSlideshowType

    /// Elements of the slideshow
    public let blocks: [TGInputRichBlock]

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockSlideshowType, blocks: [TGInputRichBlock], caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.blocks = blocks
        self.caption = caption
    }
}
