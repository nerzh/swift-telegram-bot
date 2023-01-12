// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a link to an MP3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedAudio](https://core.telegram.org/bots/api#inlinequeryresultcachedaudio)
 */
public final class TGInlineQueryResultCachedAudio: Codable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedAudio` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case audioFileId = "audio_file_id"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be audio
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid file identifier for the audio file
    public var audioFileId: String

    /// Optional. Caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the audio caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [TGMessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the audio
    public var inputMessageContent: TGInputMessageContent?

    public init (type: String, id: String, audioFileId: String, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.audioFileId = audioFileId
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
