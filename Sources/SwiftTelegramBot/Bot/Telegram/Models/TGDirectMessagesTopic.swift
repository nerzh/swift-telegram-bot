// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a topic of a direct messages chat.

 SeeAlso Telegram Bot API Reference:
 [DirectMessagesTopic](https://core.telegram.org/bots/api#directmessagestopic)
 **/
public final class TGDirectMessagesTopic: Codable, Sendable {

    /// Custom keys for coding/decoding `DirectMessagesTopic` struct
    public enum CodingKeys: String, CodingKey {
        case topicId = "topic_id"
        case user = "user"
    }

    /// Unique identifier of the topic. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    public let topicId: Int

    /// Optional. Information about the user that created the topic. Currently, it is always present
    public let user: TGUser?

    public init (topicId: Int, user: TGUser? = nil) {
        self.topicId = topicId
        self.user = user
    }
}
