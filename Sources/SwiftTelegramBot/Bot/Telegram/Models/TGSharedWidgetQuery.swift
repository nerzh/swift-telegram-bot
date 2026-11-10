// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an incoming query from a forwarded message with a shared widget created by the bot. Use answerWidgetQuery to answer the query. Each user can send at most 5 queries per 5 seconds to the bot from all its widgets.

 SeeAlso Telegram Bot API Reference:
 [SharedWidgetQuery](https://core.telegram.org/bots/api#sharedwidgetquery)
 **/
public final class TGSharedWidgetQuery: Codable, Sendable {

    /// Custom keys for coding/decoding `SharedWidgetQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case from = "from"
        case type = "type"
        case data = "data"
        case widgetId = "widget_id"
    }

    /// Unique identifier for this query
    public let id: String

    /// Sender
    public let from: TGUser

    /// Type of the query
    public let type: TGWidgetQueryType

    /// Data of the query, 1-64 bytes
    public let data: String

    /// Unique identifier of the shared widget, which sent the query
    public let widgetId: String

    public init (id: String, from: TGUser, type: TGWidgetQueryType, data: String, widgetId: String) {
        self.id = id
        self.from = from
        self.type = type
        self.data = data
        self.widgetId = widgetId
    }
}
