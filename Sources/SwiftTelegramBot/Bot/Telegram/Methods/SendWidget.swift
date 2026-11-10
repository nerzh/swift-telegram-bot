// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send a message with an HTML widget. Currently, in the production environment, widgets can be sent only to private chats, and sent widgets automatically have protected content and therefore can't be forwarded. On success, the sent Message is returned.


/// Parameters container struct for `sendWidget` method
public struct TGSendWidgetParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    public let messageThreadId: Int?

    /// HTML code of the widget, 1-32768 bytes. The code must not exceed 4096 bytes when compressed by zlib with the maximum compression level.
    public let html: String

    /// Width of the widget in logical pixels; omit if the widget must occupy the whole width of the message bubble. The width is clamped by the app to the range from 200 to the maximum width of the message bubble.
    public let width: Int?

    /// Height of the widget in logical pixels; omit if the height of the widget isn't fixed. The height is clamped by the app to the range 50-600.
    public let height: Int?

    /// Public data of the widget, 0-1024 bytes, which will be available wherever the widget is shown. If the widget is shared, then all messages with it will have the same public data.
    public let publicData: String?

    /// Data of the widget, which is specific to the message, 0-1024 bytes
    public let chatData: String?

    /// Widget caption, 0-1024 characters after entities parsing
    public let caption: String?

    /// Mode for parsing entities in the widget caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Pass True if the caption must be shown above the widget
    public let showCaptionAboveMedia: Bool?

    /// Pass True to allow the widget to send queries to the bot
    public let allowQueries: Bool?

    /// Pass True to create a shared widget, which can be sent again using the method sendSharedWidget
    public let isShared: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public let protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    public let allowPaidBroadcast: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public let messageEffectId: String?

    /// Description of the message to reply to
    public let replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    public let replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendWidgetParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
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
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, html: String, width: Int? = nil, height: Int? = nil, publicData: String? = nil, chatData: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, allowQueries: Bool? = nil, isShared: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
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
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.allowPaidBroadcast = allowPaidBroadcast
            self.messageEffectId = messageEffectId
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send a message with an HTML widget. Currently, in the production environment, widgets can be sent only to private chats, and sent widgets automatically have protected content and therefore can't be forwarded. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendWidgetParams](https://core.telegram.org/bots/api#sendwidget)
 
 - Parameters:
     - params: Parameters container, see `SendWidgetParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendWidget(params: TGSendWidgetParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendWidget")) else {
            throw BotError("Bad URL: \(getMethodURL("sendWidget"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
