// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a music file, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockAudio](https://core.telegram.org/bots/api#richblockaudio)
 **/
public final class TGRichBlockAudio: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockAudio` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case audio = "audio"
        case caption = "caption"
    }

    /// Type of the block, always “audio”
    public let type: TGRichBlockAudioType

    /// The audio
    public let audio: TGAudio

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockAudioType, audio: TGAudio, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.audio = audio
        self.caption = caption
    }
}
