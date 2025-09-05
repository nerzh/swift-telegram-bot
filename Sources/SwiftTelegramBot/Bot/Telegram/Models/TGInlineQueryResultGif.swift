// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultGif](https://core.telegram.org/bots/api#inlinequeryresultgif)
 **/
public final class TGInlineQueryResultGif: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultGif` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case gifUrl = "gif_url"
        case gifWidth = "gif_width"
        case gifHeight = "gif_height"
        case gifDuration = "gif_duration"
        case thumbnailUrl = "thumbnail_url"
        case thumbnailMimeType = "thumbnail_mime_type"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be gif
    public let type: TGInlineQueryResultGifType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid URL for the GIF file
    public let gifUrl: String

    /// Optional. Width of the GIF
    public let gifWidth: Int?

    /// Optional. Height of the GIF
    public let gifHeight: Int?

    /// Optional. Duration of the GIF in seconds
    public let gifDuration: Int?

    /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
    public let thumbnailUrl: String

    /// Optional. MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”
    public let thumbnailMimeType: String?

    /// Optional. Title for the result
    public let title: String?

    /// Optional. Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the GIF animation
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultGifType, id: String, gifUrl: String, gifWidth: Int? = nil, gifHeight: Int? = nil, gifDuration: Int? = nil, thumbnailUrl: String, thumbnailMimeType: String? = nil, title: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.gifUrl = gifUrl
        self.gifWidth = gifWidth
        self.gifHeight = gifHeight
        self.gifDuration = gifDuration
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailMimeType = thumbnailMimeType
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
