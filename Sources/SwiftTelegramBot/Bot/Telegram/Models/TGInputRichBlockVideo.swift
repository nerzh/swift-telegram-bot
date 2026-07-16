// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a video, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockVideo](https://core.telegram.org/bots/api#inputrichblockvideo)
 **/
public final class TGInputRichBlockVideo: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case video = "video"
        case caption = "caption"
    }

    /// Type of the block, always “video”
    public let type: TGInputRichBlockVideoType

    /// The video. Caption is ignored.
    public let video: TGInputMediaVideo

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockVideoType, video: TGInputMediaVideo, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.video = video
        self.caption = caption
    }
}
