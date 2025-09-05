// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to remove a message from the list of pinned messages in a chat. In private chats and channel direct messages chats, all messages can be unpinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin messages in groups and channels respectively. Returns True on success.


/// Parameters container struct for `unpinChatMessage` method
public struct TGUnpinChatMessageParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be unpinned
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Identifier of the message to unpin. Required if business_connection_id is specified. If not specified, the most recent pinned message (by sending date) will be unpinned.
    public let messageId: Int?

    /// Custom keys for coding/decoding `UnpinChatMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageId: Int? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
    }
}


public extension TGBot {

/**
 Use this method to remove a message from the list of pinned messages in a chat. In private chats and channel direct messages chats, all messages can be unpinned. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin messages in groups and channels respectively. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnpinChatMessageParams](https://core.telegram.org/bots/api#unpinchatmessage)
 
 - Parameters:
     - params: Parameters container, see `UnpinChatMessageParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("unpinChatMessage")) else {
            throw BotError("Bad URL: \(getMethodURL("unpinChatMessage"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
