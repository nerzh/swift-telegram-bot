// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedVoice](https://core.telegram.org/bots/api#inlinequeryresultcachedvoice)
 **/
public final class TGInlineQueryResultCachedVoice: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultCachedVoice` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case voiceFileId = "voice_file_id"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be voice
    public let type: TGInlineQueryResultCachedVoiceType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid file identifier for the voice message
    public let voiceFileId: String

    /// Voice message title
    public let title: String

    /// Optional. Caption, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the voice message
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultCachedVoiceType, id: String, voiceFileId: String, title: String, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.voiceFileId = voiceFileId
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
