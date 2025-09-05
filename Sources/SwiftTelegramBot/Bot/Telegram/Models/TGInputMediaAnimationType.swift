// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
 */

public enum TGInputMediaAnimationType: String, Codable, Sendable {
    case animation = "animation"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaAnimationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}