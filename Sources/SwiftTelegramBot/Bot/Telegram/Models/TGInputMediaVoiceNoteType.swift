// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a voice message file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVoiceNote](https://core.telegram.org/bots/api#inputmediavoicenote)
 */

public enum TGInputMediaVoiceNoteType: String, Codable, Sendable {
    case voiceNote = "voice_note"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaVoiceNoteType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}