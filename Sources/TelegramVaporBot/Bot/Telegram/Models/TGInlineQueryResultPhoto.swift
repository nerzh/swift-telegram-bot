// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultPhoto](https://core.telegram.org/bots/api#inlinequeryresultphoto)
 */
public final class TGInlineQueryResultPhoto: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case photoUrl = "photo_url"
        case thumbUrl = "thumb_url"
        case photoWidth = "photo_width"
        case photoHeight = "photo_height"
        case title = "title"
        case description = "description"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be photo
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid URL of the photo. Photo must be in JPEG format. Photo size must not exceed 5MB
    public var photoUrl: String

    /// URL of the thumbnail for the photo
    public var thumbUrl: String

    /// Optional. Width of the photo
    public var photoWidth: Int?

    /// Optional. Height of the photo
    public var photoHeight: Int?

    /// Optional. Title for the result
    public var title: String?

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Caption of the photo to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the photo caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the photo
    public var inputMessageContent: TGInputMessageContent?

    public init (type: String, id: String, photoUrl: String, thumbUrl: String, photoWidth: Int? = nil, photoHeight: Int? = nil, title: String? = nil, description: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.photoUrl = photoUrl
        self.thumbUrl = thumbUrl
        self.photoWidth = photoWidth
        self.photoHeight = photoHeight
        self.title = title
        self.description = description
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
