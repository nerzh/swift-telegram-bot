// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.


/// Parameters container struct for `editMessageReplyMarkup` method
public struct TGEditMessageReplyMarkupParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    public let businessConnectionId: String?

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public let messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public let inlineMessageId: String?

    /// A JSON-serialized object for an inline keyboard.
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageReplyMarkupParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.

 SeeAlso Telegram Bot API Reference:
 [EditMessageReplyMarkupParams](https://core.telegram.org/bots/api#editmessagereplymarkup)
 
 - Parameters:
     - params: Parameters container, see `EditMessageReplyMarkupParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func editMessageReplyMarkup(params: TGEditMessageReplyMarkupParams? = nil) async throws -> TGMessageOrBool {
        guard let methodURL: URL = .init(string: getMethodURL("editMessageReplyMarkup")) else {
            throw BotError("Bad URL: \(getMethodURL("editMessageReplyMarkup"))")
        }
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
