// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedSticker](https://core.telegram.org/bots/api#inlinequeryresultcachedsticker)
 **/
public final class TGInlineQueryResultCachedSticker: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedSticker` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case stickerFileId = "sticker_file_id"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be sticker
    public let type: TGInlineQueryResultCachedStickerType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid file identifier of the sticker
    public let stickerFileId: String

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the sticker
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultCachedStickerType, id: String, stickerFileId: String, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.stickerFileId = stickerFileId
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
