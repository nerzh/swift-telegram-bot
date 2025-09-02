// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultDocument](https://core.telegram.org/bots/api#inlinequeryresultdocument)
 **/
public final class TGInlineQueryResultDocument: Codable, Sendable {

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
        case thumbnailUrl = "thumbnail_url"
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }

    /// Type of the result, must be document
    public let type: TGInlineQueryResultDocumentType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// Title for the result
    public let title: String

    /// Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the document caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// A valid URL for the file
    public let documentUrl: String

    /// MIME type of the content of the file, either “application/pdf” or “application/zip”
    public let mimeType: String

    /// Optional. Short description of the result
    public let description: String?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the file
    public let inputMessageContent: TGInputMessageContent?

    /// Optional. URL of the thumbnail (JPEG only) for the file
    public let thumbnailUrl: String?

    /// Optional. Thumbnail width
    public let thumbnailWidth: Int?

    /// Optional. Thumbnail height
    public let thumbnailHeight: Int?

    public init (type: TGInlineQueryResultDocumentType, id: String, title: String, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, documentUrl: String, mimeType: String, description: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil, thumbnailUrl: String? = nil, thumbnailWidth: Int? = nil, thumbnailHeight: Int? = nil) {
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
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailWidth = thumbnailWidth
        self.thumbnailHeight = thumbnailHeight
    }
}
