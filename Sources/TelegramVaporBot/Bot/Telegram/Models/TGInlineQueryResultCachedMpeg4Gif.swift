// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif)
 */
public final class TGInlineQueryResultCachedMpeg4Gif: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedMpeg4Gif` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case mpeg4FileId = "mpeg4_file_id"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be mpeg4_gif
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid file identifier for the MPEG4 file
    public var mpeg4FileId: String

    /// Optional. Title for the result
    public var title: String?

    /// Optional. Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the video animation
    public var inputMessageContent: TGInputMessageContent?

    public init (type: String, id: String, mpeg4FileId: String, title: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.mpeg4FileId = mpeg4FileId
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
