// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a voice message file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVoiceNote](https://core.telegram.org/bots/api#inputmediavoicenote)
 **/
public final class TGInputMediaVoiceNote: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaVoiceNote` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case duration = "duration"
    }

    /// Type of the media, must be voice_note
    public let type: TGInputMediaVoiceNoteType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass "attach://<file_attach_name>" to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public let media: String

    /// Optional. Caption of the voice message to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Duration of the voice message in seconds
    public let duration: Int?

    public init (type: TGInputMediaVoiceNoteType, media: String, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, duration: Int? = nil) {
        self.type = type
        self.media = media
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.duration = duration
    }
}
