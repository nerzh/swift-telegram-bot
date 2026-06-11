// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a voice note, corresponding to the HTML tag <audio>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockVoiceNote](https://core.telegram.org/bots/api#richblockvoicenote)
 */

public enum TGRichBlockVoiceNoteType: String, Codable, Sendable {
    case voiceNote = "voice_note"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockVoiceNoteType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}