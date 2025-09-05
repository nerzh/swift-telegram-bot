// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
 If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube), you must replace its content using input_message_content.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVideo](https://core.telegram.org/bots/api#inlinequeryresultvideo)
 **/
public final class TGInlineQueryResultVideo: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultVideo` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case videoUrl = "video_url"
        case mimeType = "mime_type"
        case thumbnailUrl = "thumbnail_url"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case videoWidth = "video_width"
        case videoHeight = "video_height"
        case videoDuration = "video_duration"
        case description = "description"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be video
    public let type: TGInlineQueryResultVideoType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid URL for the embedded video player or video file
    public let videoUrl: String

    /// MIME type of the content of the video URL, “text/html” or “video/mp4”
    public let mimeType: String

    /// URL of the thumbnail (JPEG only) for the video
    public let thumbnailUrl: String

    /// Title for the result
    public let title: String

    /// Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the video caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Video width
    public let videoWidth: Int?

    /// Optional. Video height
    public let videoHeight: Int?

    /// Optional. Video duration in seconds
    public let videoDuration: Int?

    /// Optional. Short description of the result
    public let description: String?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultVideoType, id: String, videoUrl: String, mimeType: String, thumbnailUrl: String, title: String, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, videoWidth: Int? = nil, videoHeight: Int? = nil, videoDuration: Int? = nil, description: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.videoUrl = videoUrl
        self.mimeType = mimeType
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.videoWidth = videoWidth
        self.videoHeight = videoHeight
        self.videoDuration = videoDuration
        self.description = description
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
