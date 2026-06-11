// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to remove a reaction from a message in a group or a supergroup chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success.


/// Parameters container struct for `deleteMessageReaction` method
public struct TGDeleteMessageReactionParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Identifier of the target message
    public let messageId: Int

    /// Identifier of the user whose reaction will be removed, if the reaction was added by a user
    public let userId: Int64?

    /// Identifier of the chat whose reaction will be removed, if the reaction was added by a chat
    public let actorChatId: Int64?

    /// Custom keys for coding/decoding `DeleteMessageReactionParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case userId = "user_id"
            case actorChatId = "actor_chat_id"
    }

    public init(chatId: TGChatId, messageId: Int, userId: Int64? = nil, actorChatId: Int64? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.userId = userId
            self.actorChatId = actorChatId
    }
}


public extension TGBot {

/**
 Use this method to remove a reaction from a message in a group or a supergroup chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteMessageReactionParams](https://core.telegram.org/bots/api#deletemessagereaction)
 
 - Parameters:
     - params: Parameters container, see `DeleteMessageReactionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteMessageReaction(params: TGDeleteMessageReactionParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteMessageReaction")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteMessageReaction"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
