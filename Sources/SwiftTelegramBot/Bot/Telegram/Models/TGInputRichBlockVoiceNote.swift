// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a voice note, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockVoiceNote](https://core.telegram.org/bots/api#inputrichblockvoicenote)
 **/
public final class TGInputRichBlockVoiceNote: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockVoiceNote` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case voiceNote = "voice_note"
        case caption = "caption"
    }

    /// Type of the block, always “voice_note”
    public let type: TGInputRichBlockVoiceNoteType

    /// The voice note. Caption is ignored.
    public let voiceNote: TGInputMediaVoiceNote

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockVoiceNoteType, voiceNote: TGInputMediaVoiceNote, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.voiceNote = voiceNote
        self.caption = caption
    }
}
