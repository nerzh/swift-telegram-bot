// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.


/// Parameters container struct for `stopPoll` method
public struct TGStopPollParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Identifier of the original message with the poll
    public let messageId: Int

    /// A JSON-serialized object for a new message inline keyboard.
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopPollParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageId: Int, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.

 SeeAlso Telegram Bot API Reference:
 [StopPollParams](https://core.telegram.org/bots/api#stoppoll)
 
 - Parameters:
     - params: Parameters container, see `StopPollParams` struct
 - Throws: Throws on errors
 - Returns: `TGPoll`
 */

    @discardableResult
    func stopPoll(params: TGStopPollParams) async throws -> TGPoll {
        guard let methodURL: URL = .init(string: getMethodURL("stopPoll")) else {
            throw BotError("Bad URL: \(getMethodURL("stopPoll"))")
        }
        let result: TGPoll = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
