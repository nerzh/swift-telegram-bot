// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit only the reply markup of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.


/// Parameters container struct for `editEphemeralMessageReplyMarkup` method
public struct TGEditEphemeralMessageReplyMarkupParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Identifier of the user who received the message
    public let receiverUserId: Int64

    /// Identifier of the ephemeral message to edit
    public let ephemeralMessageId: Int

    /// A JSON-serialized object for an inline keyboard
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditEphemeralMessageReplyMarkupParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case receiverUserId = "receiver_user_id"
            case ephemeralMessageId = "ephemeral_message_id"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, receiverUserId: Int64, ephemeralMessageId: Int, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.receiverUserId = receiverUserId
            self.ephemeralMessageId = ephemeralMessageId
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit only the reply markup of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditEphemeralMessageReplyMarkupParams](https://core.telegram.org/bots/api#editephemeralmessagereplymarkup)
 
 - Parameters:
     - params: Parameters container, see `EditEphemeralMessageReplyMarkupParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editEphemeralMessageReplyMarkup(params: TGEditEphemeralMessageReplyMarkupParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editEphemeralMessageReplyMarkup")) else {
            throw BotError("Bad URL: \(getMethodURL("editEphemeralMessageReplyMarkup"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
