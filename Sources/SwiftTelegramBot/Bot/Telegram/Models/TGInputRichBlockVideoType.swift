// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a video, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockVideo](https://core.telegram.org/bots/api#inputrichblockvideo)
 */

public enum TGInputRichBlockVideoType: String, Codable, Sendable {
    case video = "video"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}