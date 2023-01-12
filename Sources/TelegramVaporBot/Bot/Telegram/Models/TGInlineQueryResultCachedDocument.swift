// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedDocument](https://core.telegram.org/bots/api#inlinequeryresultcacheddocument)
 */
public final class TGInlineQueryResultCachedDocument: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedDocument` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case title = "title"
        case documentFileId = "document_file_id"
        case description = "description"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be document
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// Title for the result
    public var title: String

    /// A valid file identifier for the file
    public var documentFileId: String

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the document caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the file
    public var inputMessageContent: TGInputMessageContent?

    public init (type: String, id: String, title: String, documentFileId: String, description: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.title = title
        self.documentFileId = documentFileId
        self.description = description
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
