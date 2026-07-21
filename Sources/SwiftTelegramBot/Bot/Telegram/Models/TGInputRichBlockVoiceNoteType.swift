// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a voice note, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockVoiceNote](https://core.telegram.org/bots/api#inputrichblockvoicenote)
 */

public enum TGInputRichBlockVoiceNoteType: String, Codable, Sendable {
    case voiceNote = "voice_note"
}