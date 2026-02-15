// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedGif](https://core.telegram.org/bots/api#inlinequeryresultcachedgif)
 **/
public final class TGInlineQueryResultCachedGif: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedGif` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case gifFileId = "gif_file_id"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be gif
    public let type: TGInlineQueryResultCachedGifType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid file identifier for the GIF file
    public let gifFileId: String

    /// Optional. Title for the result
    public let title: String?

    /// Optional. Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the GIF animation
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultCachedGifType, id: String, gifFileId: String, title: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.gifFileId = gifFileId
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
