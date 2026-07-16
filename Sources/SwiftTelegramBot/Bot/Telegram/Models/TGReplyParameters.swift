// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes reply parameters for the message that is being sent.

 SeeAlso Telegram Bot API Reference:
 [ReplyParameters](https://core.telegram.org/bots/api#replyparameters)
 **/
public final class TGReplyParameters: Codable, Sendable {

    /// Custom keys for coding/decoding `ReplyParameters` struct
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case chatId = "chat_id"
        case ephemeralMessageId = "ephemeral_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case quote = "quote"
        case quoteParseMode = "quote_parse_mode"
        case quoteEntities = "quote_entities"
        case quotePosition = "quote_position"
        case checklistTaskId = "checklist_task_id"
        case pollOptionId = "poll_option_id"
    }

    /// Optional. Identifier of the message that will be replied to in the current chat, or in the chat chat_id if it is specified. Required if ephemeral_message_id isn't specified.
    public let messageId: Int?

    /// Optional. If the message to be replied to is from a different chat, unique identifier for the chat or username of the bot, supergroup or channel in the format @username. Not supported for messages sent on behalf of a business account, messages from channel direct messages chats and ephemeral messages.
    public let chatId: TGChatId?

    /// Optional. Identifier of the incoming ephemeral message that will be replied to in the current chat. A reply to an ephemeral message must itself be an ephemeral message. An ephemeral message may only be replied to within 15 seconds of being sent. Required if message_id isn't specified.
    public let ephemeralMessageId: Int?

    /// Optional. Pass True if the message should be sent even if the specified message to be replied to is not found. Always False for replies in another chat or forum topic, and sent ephemeral messages. Always True for messages sent on behalf of a business account.
    public let allowSendingWithoutReply: Bool?

    /// Optional. Quoted part of the message to be replied to; 0-1024 characters after entities parsing. The quote must be an exact substring of the message to be replied to, including bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities. The message will fail to send if the quote isn't found in the original message. Ignored for ephemeral messages.
    public let quote: String?

    /// Optional. Mode for parsing entities in the quote. See formatting options for more details.
    public let quoteParseMode: TGParseMode?

    /// Optional. A JSON-serialized list of special entities that appear in the quote. It can be specified instead of quote_parse_mode.
    public let quoteEntities: [TGMessageEntity]?

    /// Optional. Position of the quote in the original message in UTF-16 code units
    public let quotePosition: Int?

    /// Optional. Identifier of the specific checklist task to be replied to
    public let checklistTaskId: Int?

    /// Optional. Persistent identifier of the specific poll option to be replied to
    public let pollOptionId: String?

    public init (messageId: Int? = nil, chatId: TGChatId? = nil, ephemeralMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, quote: String? = nil, quoteParseMode: TGParseMode? = nil, quoteEntities: [TGMessageEntity]? = nil, quotePosition: Int? = nil, checklistTaskId: Int? = nil, pollOptionId: String? = nil) {
        self.messageId = messageId
        self.chatId = chatId
        self.ephemeralMessageId = ephemeralMessageId
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.quote = quote
        self.quoteParseMode = quoteParseMode
        self.quoteEntities = quoteEntities
        self.quotePosition = quotePosition
        self.checklistTaskId = checklistTaskId
        self.pollOptionId = pollOptionId
    }
}
