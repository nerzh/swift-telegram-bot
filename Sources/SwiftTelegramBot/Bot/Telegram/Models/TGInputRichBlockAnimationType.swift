// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an animation, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockAnimation](https://core.telegram.org/bots/api#inputrichblockanimation)
 */

public enum TGInputRichBlockAnimationType: String, Codable, Sendable {
    case animation = "animation"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockAnimationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}