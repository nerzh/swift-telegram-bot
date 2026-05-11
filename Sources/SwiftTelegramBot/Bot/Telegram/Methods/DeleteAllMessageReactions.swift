// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to remove up to 10000 recent reactions in a group or a supergroup chat added by a given user or chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success.


/// Parameters container struct for `deleteAllMessageReactions` method
public struct TGDeleteAllMessageReactionsParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @username)
    public let chatId: TGChatId

    /// Identifier of the user whose reactions will be removed, if the reactions were added by a user
    public let userId: Int64?

    /// Identifier of the chat whose reactions will be removed, if the reactions were added by a chat
    public let actorChatId: Int64?

    /// Custom keys for coding/decoding `DeleteAllMessageReactionsParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case actorChatId = "actor_chat_id"
    }

    public init(chatId: TGChatId, userId: Int64? = nil, actorChatId: Int64? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.actorChatId = actorChatId
    }
}


public extension TGBot {

/**
 Use this method to remove up to 10000 recent reactions in a group or a supergroup chat added by a given user or chat. The bot must have the 'can_delete_messages' administrator right in the chat. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteAllMessageReactionsParams](https://core.telegram.org/bots/api#deleteallmessagereactions)
 
 - Parameters:
     - params: Parameters container, see `DeleteAllMessageReactionsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteAllMessageReactions(params: TGDeleteAllMessageReactionsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteAllMessageReactions")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteAllMessageReactions"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
