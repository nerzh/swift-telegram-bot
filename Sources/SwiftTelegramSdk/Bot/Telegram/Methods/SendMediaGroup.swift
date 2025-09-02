// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send a group of photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an array of Message objects that were sent is returned.


/// Parameters container struct for `sendMediaGroup` method
public struct TGSendMediaGroupParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public let messageThreadId: Int?

    /// Identifier of the direct messages topic to which the messages will be sent; required if the messages are sent to a direct messages chat
    public let directMessagesTopicId: Int?

    /// A JSON-serialized array describing messages to be sent, must include 2-10 items
    public let media: [TGInputMedia]

    /// Sends messages silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the sent messages from forwarding and saving
    public let protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance
    public let allowPaidBroadcast: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public let messageEffectId: String?

    /// Description of the message to reply to
    public let replyParameters: TGReplyParameters?

    /// Custom keys for coding/decoding `SendMediaGroupParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case directMessagesTopicId = "direct_messages_topic_id"
            case media = "media"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case replyParameters = "reply_parameters"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, directMessagesTopicId: Int? = nil, media: [TGInputMedia], disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, replyParameters: TGReplyParameters? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.directMessagesTopicId = directMessagesTopicId
            self.media = media
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.allowPaidBroadcast = allowPaidBroadcast
            self.messageEffectId = messageEffectId
            self.replyParameters = replyParameters
    }
}


public extension TGBot {

/**
 Use this method to send a group of photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an array of Message objects that were sent is returned.

 SeeAlso Telegram Bot API Reference:
 [SendMediaGroupParams](https://core.telegram.org/bots/api#sendmediagroup)
 
 - Parameters:
     - params: Parameters container, see `SendMediaGroupParams` struct
 - Throws: Throws on errors
 - Returns: `[TGMessage]`
 */

    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) async throws -> [TGMessage] {
        guard let methodURL: URL = .init(string: getMethodURL("sendMediaGroup")) else {
            throw BotError("Bad URL: \(getMethodURL("sendMediaGroup"))")
        }
        let result: [TGMessage] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
