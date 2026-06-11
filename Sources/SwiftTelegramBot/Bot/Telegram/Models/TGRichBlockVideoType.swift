// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a video, corresponding to the HTML tag <video>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockVideo](https://core.telegram.org/bots/api#richblockvideo)
 */

public enum TGRichBlockVideoType: String, Codable, Sendable {
    case video = "video"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockVideoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}