// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to add a message to the list of pinned messages in a chat. In private chats and channel direct messages chats, all non-service messages can be pinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to pin messages in groups and channels respectively. Returns True on success.


/// Parameters container struct for `pinChatMessage` method
public struct TGPinChatMessageParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be pinned
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Identifier of a message to pin
    public let messageId: Int

    /// Pass True if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.
    public let disableNotification: Bool?

    /// Custom keys for coding/decoding `PinChatMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case disableNotification = "disable_notification"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageId: Int, disableNotification: Bool? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
            self.disableNotification = disableNotification
    }
}


public extension TGBot {

/**
 Use this method to add a message to the list of pinned messages in a chat. In private chats and channel direct messages chats, all non-service messages can be pinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to pin messages in groups and channels respectively. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [PinChatMessageParams](https://core.telegram.org/bots/api#pinchatmessage)
 
 - Parameters:
     - params: Parameters container, see `PinChatMessageParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func pinChatMessage(params: TGPinChatMessageParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("pinChatMessage")) else {
            throw BotError("Bad URL: \(getMethodURL("pinChatMessage"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
