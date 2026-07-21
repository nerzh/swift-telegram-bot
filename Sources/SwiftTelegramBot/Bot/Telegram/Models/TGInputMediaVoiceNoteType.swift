// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a voice message file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVoiceNote](https://core.telegram.org/bots/api#inputmediavoicenote)
 */

public enum TGInputMediaVoiceNoteType: String, Codable, Sendable {
    case voiceNote = "voice_note"
}