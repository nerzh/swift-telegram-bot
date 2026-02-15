// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
 **/
public final class TGInlineQueryResultVoice: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultVoice` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case voiceUrl = "voice_url"
        case title = "title"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case voiceDuration = "voice_duration"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be voice
    public let type: TGInlineQueryResultVoiceType

    /// Unique identifier for this result, 1-64 bytes
    public let id: String

    /// A valid URL for the voice recording
    public let voiceUrl: String

    /// Recording title
    public let title: String

    /// Optional. Caption, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Recording duration in seconds
    public let voiceDuration: Int?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the voice recording
    public let inputMessageContent: TGInputMessageContent?

    public init (type: TGInlineQueryResultVoiceType, id: String, voiceUrl: String, title: String, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, voiceDuration: Int? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil) {
        self.type = type
        self.id = id
        self.voiceUrl = voiceUrl
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.voiceDuration = voiceDuration
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
