// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an incoming query from a widget in a message sent by the bot or via the bot. Use answerWidgetQuery to answer the query. Each user can send at most 5 queries per 5 seconds to the bot from all its widgets.

 SeeAlso Telegram Bot API Reference:
 [WidgetQuery](https://core.telegram.org/bots/api#widgetquery)
 **/
public final class TGWidgetQuery: Codable, Sendable {

    /// Custom keys for coding/decoding `WidgetQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case from = "from"
        case chat = "chat"
        case messageId = "message_id"
        case inlineMessageId = "inline_message_id"
        case chatInstance = "chat_instance"
        case chatType = "chat_type"
        case type = "type"
        case data = "data"
        case widgetId = "widget_id"
    }

    /// Unique identifier for this query
    public let id: String

    /// Sender
    public let from: TGUser

    /// Optional. Chat with the message containing the widget; omitted if the widget is in an inline message
    public let chat: TGChat?

    /// Optional. Identifier of the message containing the widget; omitted if the widget is in an inline message
    public let messageId: Int?

    /// Optional. Identifier of the inline message containing the widget
    public let inlineMessageId: String?

    /// Global identifier, uniquely corresponding to the chat to which the message with the widget was sent
    public let chatInstance: String

    /// Optional. For widgets in inline messages, type of the chat to which the message was sent. Can be either “sender” for a private chat with the inline query sender, “private”, “group”, “supergroup”, or “channel”.
    public let chatType: String?

    /// Type of the query
    public let type: TGWidgetQueryType

    /// Data of the query, 1-64 bytes
    public let data: String

    /// Optional. Unique identifier of the shared widget, which sent the query; omitted if the widget isn't shared
    public let widgetId: String?

    public init (id: String, from: TGUser, chat: TGChat? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, chatInstance: String, chatType: String? = nil, type: TGWidgetQueryType, data: String, widgetId: String? = nil) {
        self.id = id
        self.from = from
        self.chat = chat
        self.messageId = messageId
        self.inlineMessageId = inlineMessageId
        self.chatInstance = chatInstance
        self.chatType = chatType
        self.type = type
        self.data = data
        self.widgetId = widgetId
    }
}
