// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a video to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVideo](https://core.telegram.org/bots/api#inputmediavideo)
 */
public final class TGInputMediaVideo: Encodable {

    /// Custom keys for coding/decoding `InputMediaVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case thumb = "thumb"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case supportsStreaming = "supports_streaming"
    }

    /// Type of the result, must be video
    public var type: String

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public var media: String

    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public var thumb: TGFileInfo?

    /// Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the video caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Video width
    public var width: Int?

    /// Optional. Video height
    public var height: Int?

    /// Optional. Video duration in seconds
    public var duration: Int?

    /// Optional. Pass True if the uploaded video is suitable for streaming
    public var supportsStreaming: Bool?

    public init (type: String, media: String, thumb: TGFileInfo? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, width: Int? = nil, height: Int? = nil, duration: Int? = nil, supportsStreaming: Bool? = nil) {
        self.type = type
        self.media = media
        self.thumb = thumb
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.width = width
        self.height = height
        self.duration = duration
        self.supportsStreaming = supportsStreaming
    }
}
