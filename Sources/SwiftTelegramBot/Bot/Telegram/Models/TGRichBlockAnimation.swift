// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an animation, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockAnimation](https://core.telegram.org/bots/api#richblockanimation)
 **/
public final class TGRichBlockAnimation: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockAnimation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case animation = "animation"
        case hasSpoiler = "has_spoiler"
        case caption = "caption"
    }

    /// Type of the block, always “animation”
    public let type: TGRichBlockAnimationType

    /// The animation
    public let animation: TGAnimation

    /// Optional. True, if the media preview is covered by a spoiler animation
    public let hasSpoiler: Bool?

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockAnimationType, animation: TGAnimation, hasSpoiler: Bool? = nil, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.animation = animation
        self.hasSpoiler = hasSpoiler
        self.caption = caption
    }
}
