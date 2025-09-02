// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.


/// Parameters container struct for `stopMessageLiveLocation` method
public struct TGStopMessageLiveLocationParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    public let businessConnectionId: String?

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message with live location to stop
    public let messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public let inlineMessageId: String?

    /// A JSON-serialized object for a new inline keyboard.
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopMessageLiveLocationParams` struct
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
 Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.

 SeeAlso Telegram Bot API Reference:
 [StopMessageLiveLocationParams](https://core.telegram.org/bots/api#stopmessagelivelocation)
 
 - Parameters:
     - params: Parameters container, see `StopMessageLiveLocationParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func stopMessageLiveLocation(params: TGStopMessageLiveLocationParams? = nil) async throws -> TGMessageOrBool {
        guard let methodURL: URL = .init(string: getMethodURL("stopMessageLiveLocation")) else {
            throw BotError("Bad URL: \(getMethodURL("stopMessageLiveLocation"))")
        }
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
