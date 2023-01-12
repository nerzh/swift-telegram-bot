// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultDocument](https://core.telegram.org/bots/api#inlinequeryresultdocument)
 */
public final class TGInlineQueryResultDocument: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultDocument` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case documentUrl = "document_url"
        case mimeType = "mime_type"
        case description = "description"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
        case thumbUrl = "thumb_url"
        case thumbWidth = "thumb_width"
        case thumbHeight = "thumb_height"
    }

    /// Type of the result, must be document
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// Title for the result
    public var title: String

    /// Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the document caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// A valid URL for the file
    public var documentUrl: String

    /// MIME type of the content of the file, either “application/pdf” or “application/zip”
    public var mimeType: String

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the file
    public var inputMessageContent: TGInputMessageContent?

    /// Optional. URL of the thumbnail (JPEG only) for the file
    public var thumbUrl: String?

    /// Optional. Thumbnail width
    public var thumbWidth: Int?

    /// Optional. Thumbnail height
    public var thumbHeight: Int?

    public init (type: String, id: String, title: String, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, documentUrl: String, mimeType: String, description: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil, thumbUrl: String? = nil, thumbWidth: Int? = nil, thumbHeight: Int? = nil) {
        self.type = type
        self.id = id
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.documentUrl = documentUrl
        self.mimeType = mimeType
        self.description = description
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
        self.thumbUrl = thumbUrl
        self.thumbWidth = thumbWidth
        self.thumbHeight = thumbHeight
    }
}
