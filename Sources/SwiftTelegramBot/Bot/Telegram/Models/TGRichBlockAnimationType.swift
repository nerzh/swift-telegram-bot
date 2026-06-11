// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an animation, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockAnimation](https://core.telegram.org/bots/api#richblockanimation)
 */

public enum TGRichBlockAnimationType: String, Codable, Sendable {
    case animation = "animation"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockAnimationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}