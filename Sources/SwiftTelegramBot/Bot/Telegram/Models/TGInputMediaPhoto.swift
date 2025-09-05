// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a photo to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaPhoto](https://core.telegram.org/bots/api#inputmediaphoto)
 **/
public final class TGInputMediaPhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case hasSpoiler = "has_spoiler"
    }

    /// Type of the result, must be photo
    public let type: TGInputMediaPhotoType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public let media: String

    /// Optional. Caption of the photo to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the photo caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Pass True if the photo needs to be covered with a spoiler animation
    public let hasSpoiler: Bool?

    public init (type: TGInputMediaPhotoType, media: String, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, hasSpoiler: Bool? = nil) {
        self.type = type
        self.media = media
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.hasSpoiler = hasSpoiler
    }
}
