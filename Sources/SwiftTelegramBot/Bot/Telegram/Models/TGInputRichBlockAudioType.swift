// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a music file, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockAudio](https://core.telegram.org/bots/api#inputrichblockaudio)
 */

public enum TGInputRichBlockAudioType: String, Codable, Sendable {
    case audio = "audio"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockAudioType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}