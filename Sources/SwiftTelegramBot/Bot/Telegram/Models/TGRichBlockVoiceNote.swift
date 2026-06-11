// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a voice note, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockVoiceNote](https://core.telegram.org/bots/api#richblockvoicenote)
 **/
public final class TGRichBlockVoiceNote: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockVoiceNote` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case voiceNote = "voice_note"
        case caption = "caption"
    }

    /// Type of the block, always “voice_note”
    public let type: TGRichBlockVoiceNoteType

    /// The voice note
    public let voiceNote: TGVoice

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockVoiceNoteType, voiceNote: TGVoice, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.voiceNote = voiceNote
        self.caption = caption
    }
}
