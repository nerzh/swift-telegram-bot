// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to an article or web page.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultArticle](https://core.telegram.org/bots/api#inlinequeryresultarticle)
 */
public final class TGInlineQueryResultArticle: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultArticle` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case title = "title"
        case inputMessageContent = "input_message_content"
        case replyMarkup = "reply_markup"
        case url = "url"
        case hideUrl = "hide_url"
        case description = "description"
        case thumbUrl = "thumb_url"
        case thumbWidth = "thumb_width"
        case thumbHeight = "thumb_height"
    }

    /// Type of the result, must be article
    public var type: String

    /// Unique identifier for this result, 1-64 Bytes
    public var id: String

    /// Title of the result
    public var title: String

    /// Content of the message to be sent
    public var inputMessageContent: TGInputMessageContent

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. URL of the result
    public var url: String?

    /// Optional. Pass True if you don't want the URL to be shown in the message
    public var hideUrl: Bool?

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Url of the thumbnail for the result
    public var thumbUrl: String?

    /// Optional. Thumbnail width
    public var thumbWidth: Int?

    /// Optional. Thumbnail height
    public var thumbHeight: Int?

    public init (type: String, id: String, title: String, inputMessageContent: TGInputMessageContent, replyMarkup: TGInlineKeyboardMarkup? = nil, url: String? = nil, hideUrl: Bool? = nil, description: String? = nil, thumbUrl: String? = nil, thumbWidth: Int? = nil, thumbHeight: Int? = nil) {
        self.type = type
        self.id = id
        self.title = title
        self.inputMessageContent = inputMessageContent
        self.replyMarkup = replyMarkup
        self.url = url
        self.hideUrl = hideUrl
        self.description = description
        self.thumbUrl = thumbUrl
        self.thumbWidth = thumbWidth
        self.thumbHeight = thumbHeight
    }
}
