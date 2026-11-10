// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes an HTML widget.

 SeeAlso Telegram Bot API Reference:
 [Widget](https://core.telegram.org/bots/api#widget)
 **/
public final class TGWidget: Codable, Sendable {

    /// Custom keys for coding/decoding `Widget` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case width = "width"
        case height = "height"
        case html = "html"
        case publicData = "public_data"
        case chatData = "chat_data"
    }

    /// Optional. Unique identifier of the shared widget, which can be used to send the widget again using the method sendSharedWidget; omitted if the widget isn't shared
    public let id: String?

    /// Optional. Width of the widget in logical pixels; omitted if the widget must occupy the whole width of the message bubble
    public let width: Int?

    /// Optional. Height of the widget in logical pixels; omitted if the height of the widget isn't fixed
    public let height: Int?

    /// HTML code of the widget
    public let html: String

    /// Optional. Public data of the widget, which is available wherever the widget is shown. All messages with a shared widget have the same public data.
    public let publicData: String?

    /// Optional. Data of the widget, which is specific to the message
    public let chatData: String?

    public init (id: String? = nil, width: Int? = nil, height: Int? = nil, html: String, publicData: String? = nil, chatData: String? = nil) {
        self.id = id
        self.width = width
        self.height = height
        self.html = html
        self.publicData = publicData
        self.chatData = chatData
    }
}
