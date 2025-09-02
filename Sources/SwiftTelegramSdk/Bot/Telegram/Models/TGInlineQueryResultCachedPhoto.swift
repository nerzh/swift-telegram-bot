// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedPhoto](https://core.telegram.org/bots/api#inlinequeryresultcachedphoto)
 **/
public final class TGInlineQueryResultCachedPhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case photoFileId = "photo_file_id"
        case title = "title"
        case description = "description"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be photo
    public let type: TGInlineQueryResultCachedPhotoType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid file identifier of the photo
    public let photoFileId: String

    /// Optional. Title for the result
    public let title: String?

    /// Optional. Short description of the result
    public let description: String?

    /// Optional. Caption of the photo to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the photo caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the photo
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultCachedPhotoType, id: String, photoFileId: String, title: String? = nil, description: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.photoFileId = photoFileId
        self.title = title
        self.description = description
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
