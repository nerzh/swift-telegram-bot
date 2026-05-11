// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a live photo to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaLivePhoto](https://core.telegram.org/bots/api#inputmedialivephoto)
 **/
public final class TGInputMediaLivePhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaLivePhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case photo = "photo"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case hasSpoiler = "has_spoiler"
    }

    /// Type of the result, must be live_photo
    public let type: TGInputMediaLivePhotoType

    /// Video of the live photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    public let media: String

    /// The static photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    public let photo: String

    /// Optional. Caption of the live photo to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the live photo caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Pass True if the live photo needs to be covered with a spoiler animation
    public let hasSpoiler: Bool?

    public init (type: TGInputMediaLivePhotoType, media: String, photo: String, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, hasSpoiler: Bool? = nil) {
        self.type = type
        self.media = media
        self.photo = photo
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.hasSpoiler = hasSpoiler
    }
}
