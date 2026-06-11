// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a music file, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockAudio](https://core.telegram.org/bots/api#richblockaudio)
 */

public enum TGRichBlockAudioType: String, Codable, Sendable {
    case audio = "audio"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockAudioType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}