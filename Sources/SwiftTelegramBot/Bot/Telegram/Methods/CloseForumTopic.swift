// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to close an open topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.


/// Parameters container struct for `closeForumTopic` method
public struct TGCloseForumTopicParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread of the forum topic
    public let messageThreadId: Int

    /// Custom keys for coding/decoding `CloseForumTopicParams` struct
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
 Use this method to close an open topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [CloseForumTopicParams](https://core.telegram.org/bots/api#closeforumtopic)
 
 - Parameters:
     - params: Parameters container, see `CloseForumTopicParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func closeForumTopic(params: TGCloseForumTopicParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("closeForumTopic")) else {
            throw BotError("Bad URL: \(getMethodURL("closeForumTopic"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
