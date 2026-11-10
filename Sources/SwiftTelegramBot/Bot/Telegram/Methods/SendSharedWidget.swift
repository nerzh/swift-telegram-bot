// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send again a shared widget created by the bot. Currently, in the production environment, widgets can be sent only to private chats, and sent widgets automatically have protected content and therefore can't be forwarded. On success, the sent Message is returned.


/// Parameters container struct for `sendSharedWidget` method
public struct TGSendSharedWidgetParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    public let messageThreadId: Int?

    /// Unique identifier of the shared widget
    public let widgetId: String

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

    /// Custom keys for coding/decoding `SendSharedWidgetParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case widgetId = "widget_id"
            case chatData = "chat_data"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case showCaptionAboveMedia = "show_caption_above_media"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, widgetId: String, chatData: String? = nil, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.widgetId = widgetId
            self.chatData = chatData
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.showCaptionAboveMedia = showCaptionAboveMedia
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
 Use this method to send again a shared widget created by the bot. Currently, in the production environment, widgets can be sent only to private chats, and sent widgets automatically have protected content and therefore can't be forwarded. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendSharedWidgetParams](https://core.telegram.org/bots/api#sendsharedwidget)
 
 - Parameters:
     - params: Parameters container, see `SendSharedWidgetParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendSharedWidget(params: TGSendSharedWidgetParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendSharedWidget")) else {
            throw BotError("Bad URL: \(getMethodURL("sendSharedWidget"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
