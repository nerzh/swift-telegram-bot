// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a voice note, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockVoiceNote](https://core.telegram.org/bots/api#richblockvoicenote)
 */

public enum TGRichBlockVoiceNoteType: String, Codable, Sendable {
    case voiceNote = "voice_note"
}