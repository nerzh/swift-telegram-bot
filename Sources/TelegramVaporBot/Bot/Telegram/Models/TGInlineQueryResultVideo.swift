// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
 If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube), you must replace its content using input_message_content.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVideo](https://core.telegram.org/bots/api#inlinequeryresultvideo)
 */
public final class TGInlineQueryResultVideo: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case videoUrl = "video_url"
        case mimeType = "mime_type"
        case thumbUrl = "thumb_url"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case videoWidth = "video_width"
        case videoHeight = "video_height"
        case videoDuration = "video_duration"
        case description = "description"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be video
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid URL for the embedded video player or video file
    public var videoUrl: String

    /// MIME type of the content of the video URL, “text/html” or “video/mp4”
    public var mimeType: String

    /// URL of the thumbnail (JPEG only) for the video
    public var thumbUrl: String

    /// Title for the result
    public var title: String

    /// Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the video caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Video width
    public var videoWidth: Int?

    /// Optional. Video height
    public var videoHeight: Int?

    /// Optional. Video duration in seconds
    public var videoDuration: Int?

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
    public var inputMessageContent: TGInputMessageContent?

    public init (type: String, id: String, videoUrl: String, mimeType: String, thumbUrl: String, title: String, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, videoWidth: Int? = nil, videoHeight: Int? = nil, videoDuration: Int? = nil, description: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.videoUrl = videoUrl
        self.mimeType = mimeType
        self.thumbUrl = thumbUrl
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.videoWidth = videoWidth
        self.videoHeight = videoHeight
        self.videoDuration = videoDuration
        self.description = description
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
