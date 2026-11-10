// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the content of a message with a shared widget to be sent as the result of an inline query. Currently, widgets can't be sent in response to inline queries in the production environment.

 SeeAlso Telegram Bot API Reference:
 [InputSharedWidgetMessageContent](https://core.telegram.org/bots/api#inputsharedwidgetmessagecontent)
 **/
public final class TGInputSharedWidgetMessageContent: Codable, Sendable {

    /// Custom keys for coding/decoding `InputSharedWidgetMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case widgetId = "widget_id"
        case chatData = "chat_data"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
    }

    /// Unique identifier of the shared widget created by the bot
    public let widgetId: String

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

    public init (widgetId: String, chatData: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil) {
        self.widgetId = widgetId
        self.chatData = chatData
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
    }
}
