// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a video, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockVideo](https://core.telegram.org/bots/api#richblockvideo)
 **/
public final class TGRichBlockVideo: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case video = "video"
        case hasSpoiler = "has_spoiler"
        case caption = "caption"
    }

    /// Type of the block, always “video”
    public let type: TGRichBlockVideoType

    /// The video
    public let video: TGVideo

    /// Optional. True, if the media preview is covered by a spoiler animation
    public let hasSpoiler: Bool?

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockVideoType, video: TGVideo, hasSpoiler: Bool? = nil, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.video = video
        self.hasSpoiler = hasSpoiler
        self.caption = caption
    }
}
