// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the content of a message with an HTML widget to be sent as the result of an inline query. Currently, widgets can't be sent in response to inline queries in the production environment.

 SeeAlso Telegram Bot API Reference:
 [InputWidgetMessageContent](https://core.telegram.org/bots/api#inputwidgetmessagecontent)
 **/
public final class TGInputWidgetMessageContent: Codable, Sendable {

    /// Custom keys for coding/decoding `InputWidgetMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case html = "html"
        case width = "width"
        case height = "height"
        case publicData = "public_data"
        case chatData = "chat_data"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case allowQueries = "allow_queries"
        case isShared = "is_shared"
    }

    /// HTML code of the widget, 1-32768 bytes. The code must not exceed 4096 bytes when compressed by zlib with the maximum compression level.
    public let html: String

    /// Optional. Width of the widget in logical pixels; omit if the widget must occupy the whole width of the message bubble. The width is clamped by the app to the range from 200 to the maximum width of the message bubble.
    public let width: Int?

    /// Optional. Height of the widget in logical pixels; omit if the height of the widget isn't fixed. The height is clamped by the app to the range 50-600.
    public let height: Int?

    /// Optional. Public data of the widget, 0-1024 bytes, which will be available wherever the widget is shown. If the widget is shared, then all messages with it will have the same public data.
    public let publicData: String?

    /// Optional. Data of the widget, which is specific to the message, 0-1024 bytes
    public let chatData: String?

    /// Optional. Widget caption, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the widget caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Pass True if the caption must be shown above the widget
    public let showCaptionAboveMedia: Bool?

    /// Optional. Pass True to allow the widget to send queries to the bot
    public let allowQueries: Bool?

    /// Optional. Pass True to create a shared widget. Each message sent from the result creates a separate shared widget, whose identifier is received by the bot only in the field widget_id of queries from the widget. To send an existing shared widget in response to an inline query, use InputSharedWidgetMessageContent instead.
    public let isShared: Bool?

    public init (html: String, width: Int? = nil, height: Int? = nil, publicData: String? = nil, chatData: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, allowQueries: Bool? = nil, isShared: Bool? = nil) {
        self.html = html
        self.width = width
        self.height = height
        self.publicData = publicData
        self.chatData = chatData
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.allowQueries = allowQueries
        self.isShared = isShared
    }
}
