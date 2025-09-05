// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedMpeg4Gif](https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif)
 **/
public final class TGInlineQueryResultCachedMpeg4Gif: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedMpeg4Gif` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case mpeg4FileId = "mpeg4_file_id"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be mpeg4_gif
    public let type: TGInlineQueryResultCachedMpeg4GifType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid file identifier for the MPEG4 file
    public let mpeg4FileId: String

    /// Optional. Title for the result
    public let title: String?

    /// Optional. Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the video animation
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultCachedMpeg4GifType, id: String, mpeg4FileId: String, title: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.mpeg4FileId = mpeg4FileId
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
