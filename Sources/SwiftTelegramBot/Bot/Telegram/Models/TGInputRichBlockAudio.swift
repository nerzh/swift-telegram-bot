// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a music file, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockAudio](https://core.telegram.org/bots/api#inputrichblockaudio)
 **/
public final class TGInputRichBlockAudio: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockAudio` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case audio = "audio"
        case caption = "caption"
    }

    /// Type of the block, always “audio”
    public let type: TGInputRichBlockAudioType

    /// The audio. Caption is ignored.
    public let audio: TGInputMediaAudio

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockAudioType, audio: TGInputMediaAudio, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.audio = audio
        self.caption = caption
    }
}
