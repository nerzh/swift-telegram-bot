// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to reopen a closed topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.


/// Parameters container struct for `reopenForumTopic` method
public struct TGReopenForumTopicParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread of the forum topic
    public let messageThreadId: Int

    /// Custom keys for coding/decoding `ReopenForumTopicParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
    }

    public init(chatId: TGChatId, messageThreadId: Int) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
    }
}


public extension TGBot {

/**
 Use this method to reopen a closed topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ReopenForumTopicParams](https://core.telegram.org/bots/api#reopenforumtopic)
 
 - Parameters:
     - params: Parameters container, see `ReopenForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func reopenForumTopic(params: TGReopenForumTopicParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("reopenForumTopic")) else {
            throw BotError("Bad URL: \(getMethodURL("reopenForumTopic"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
