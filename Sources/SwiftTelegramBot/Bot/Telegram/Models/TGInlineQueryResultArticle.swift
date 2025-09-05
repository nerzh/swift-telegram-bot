// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an article or web page.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultArticle](https://core.telegram.org/bots/api#inlinequeryresultarticle)
 **/
public final class TGInlineQueryResultArticle: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultArticle` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case title = "title"
        case inputMessageContent = "input_message_content"
        case replyMarkup = "reply_markup"
        case url = "url"
        case description = "description"
        case thumbnailUrl = "thumbnail_url"
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }

    /// Type of the result, must be article
    public let type: TGInlineQueryResultArticleType

    /// Unique identifier for this result, 1-64 Bytes
    public let id: String

    /// Title of the result
    public let title: String

    /// Content of the message to be sent
    public let inputMessageContent: TGInputMessageContent

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. URL of the result
    public let url: String?

    /// Optional. Short description of the result
    public let description: String?

    /// Optional. Url of the thumbnail for the result
    public let thumbnailUrl: String?

    /// Optional. Thumbnail width
    public let thumbnailWidth: Int?

    /// Optional. Thumbnail height
    public let thumbnailHeight: Int?

    public init (type: TGInlineQueryResultArticleType, id: String, title: String, inputMessageContent: TGInputMessageContent, replyMarkup: TGInlineKeyboardMarkup? = nil, url: String? = nil, description: String? = nil, thumbnailUrl: String? = nil, thumbnailWidth: Int? = nil, thumbnailHeight: Int? = nil) {
        self.type = type
        self.id = id
        self.title = title
        self.inputMessageContent = inputMessageContent
        self.replyMarkup = replyMarkup
        self.url = url
        self.description = description
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailWidth = thumbnailWidth
        self.thumbnailHeight = thumbnailHeight
    }
}
