// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes an update about a user stopping message generation.

 SeeAlso Telegram Bot API Reference:
 [MessageGenerationStopped](https://core.telegram.org/bots/api#messagegenerationstopped)
 **/
public final class TGMessageGenerationStopped: Codable, Sendable {

    /// Custom keys for coding/decoding `MessageGenerationStopped` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case messageThreadId = "message_thread_id"
        case draftId = "draft_id"
    }

    /// Chat in which the message is generated
    public let chat: TGChat

    /// Optional. Unique identifier of the message thread in which the message is generated
    public let messageThreadId: Int?

    /// Unique identifier of the message draft which was stopped
    public let draftId: Int

    public init (chat: TGChat, messageThreadId: Int? = nil, draftId: Int) {
        self.chat = chat
        self.messageThreadId = messageThreadId
        self.draftId = draftId
    }
}
