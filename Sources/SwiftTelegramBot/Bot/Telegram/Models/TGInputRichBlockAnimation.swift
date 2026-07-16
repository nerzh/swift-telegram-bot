// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an animation, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockAnimation](https://core.telegram.org/bots/api#inputrichblockanimation)
 **/
public final class TGInputRichBlockAnimation: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockAnimation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case animation = "animation"
        case caption = "caption"
    }

    /// Type of the block, always “animation”
    public let type: TGInputRichBlockAnimationType

    /// The animation. Caption is ignored.
    public let animation: TGInputMediaAnimation

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockAnimationType, animation: TGInputMediaAnimation, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.animation = animation
        self.caption = caption
    }
}
