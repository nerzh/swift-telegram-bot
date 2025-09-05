// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a video to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
 **/
public final class TGInputMediaVideo: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case thumbnail = "thumbnail"
        case cover = "cover"
        case startTimestamp = "start_timestamp"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case supportsStreaming = "supports_streaming"
        case hasSpoiler = "has_spoiler"
    }

    /// Type of the result, must be video
    public let type: TGInputMediaVideoType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public let media: String

    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public let thumbnail: String?

    /// Optional. Cover for the video in the message. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public let cover: String?

    /// Optional. Start timestamp for the video in the message
    public let startTimestamp: Int?

    /// Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the video caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Video width
    public let width: Int?

    /// Optional. Video height
    public let height: Int?

    /// Optional. Video duration in seconds
    public let duration: Int?

    /// Optional. Pass True if the uploaded video is suitable for streaming
    public let supportsStreaming: Bool?

    /// Optional. Pass True if the video needs to be covered with a spoiler animation
    public let hasSpoiler: Bool?

    public init (type: TGInputMediaVideoType, media: String, thumbnail: String? = nil, cover: String? = nil, startTimestamp: Int? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, width: Int? = nil, height: Int? = nil, duration: Int? = nil, supportsStreaming: Bool? = nil, hasSpoiler: Bool? = nil) {
        self.type = type
        self.media = media
        self.thumbnail = thumbnail
        self.cover = cover
        self.startTimestamp = startTimestamp
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.width = width
        self.height = height
        self.duration = duration
        self.supportsStreaming = supportsStreaming
        self.hasSpoiler = hasSpoiler
    }
}
