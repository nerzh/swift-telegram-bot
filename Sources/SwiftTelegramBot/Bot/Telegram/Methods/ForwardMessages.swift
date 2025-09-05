// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to forward multiple messages of any kind. If some of the specified messages can't be found or forwarded, they are skipped. Service messages and messages with protected content can't be forwarded. Album grouping is kept for forwarded messages. On success, an array of MessageId of the sent messages is returned.


/// Parameters container struct for `forwardMessages` method
public struct TGForwardMessagesParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public let messageThreadId: Int?

    /// Identifier of the direct messages topic to which the messages will be forwarded; required if the messages are forwarded to a direct messages chat
    public let directMessagesTopicId: Int?

    /// Unique identifier for the chat where the original messages were sent (or channel username in the format @channelusername)
    public let fromChatId: TGChatId

    /// A JSON-serialized list of 1-100 identifiers of messages in the chat from_chat_id to forward. The identifiers must be specified in a strictly increasing order.
    public let messageIds: [Int]

    /// Sends the messages silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the forwarded messages from forwarding and saving
    public let protectContent: Bool?

    /// Custom keys for coding/decoding `ForwardMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case directMessagesTopicId = "direct_messages_topic_id"
            case fromChatId = "from_chat_id"
            case messageIds = "message_ids"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, directMessagesTopicId: Int? = nil, fromChatId: TGChatId, messageIds: [Int], disableNotification: Bool? = nil, protectContent: Bool? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.directMessagesTopicId = directMessagesTopicId
            self.fromChatId = fromChatId
            self.messageIds = messageIds
            self.disableNotification = disableNotification
            self.protectContent = protectContent
    }
}


public extension TGBot {

/**
 Use this method to forward multiple messages of any kind. If some of the specified messages can't be found or forwarded, they are skipped. Service messages and messages with protected content can't be forwarded. Album grouping is kept for forwarded messages. On success, an array of MessageId of the sent messages is returned.

 SeeAlso Telegram Bot API Reference:
 [ForwardMessagesParams](https://core.telegram.org/bots/api#forwardmessages)
 
 - Parameters:
     - params: Parameters container, see `ForwardMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `[TGMessageId]`
 */

    @discardableResult
    func forwardMessages(params: TGForwardMessagesParams) async throws -> [TGMessageId] {
        guard let methodURL: URL = .init(string: getMethodURL("forwardMessages")) else {
            throw BotError("Bad URL: \(getMethodURL("forwardMessages"))")
        }
        let result: [TGMessageId] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
