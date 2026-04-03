// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about an option deleted from a poll.

 SeeAlso Telegram Bot API Reference:
 [PollOptionDeleted](https://core.telegram.org/bots/api#polloptiondeleted)
 **/
public final class TGPollOptionDeleted: Codable, Sendable {

    /// Custom keys for coding/decoding `PollOptionDeleted` struct
    public enum CodingKeys: String, CodingKey {
        case pollMessage = "poll_message"
        case optionPersistentId = "option_persistent_id"
        case optionText = "option_text"
        case optionTextEntities = "option_text_entities"
    }

    /// Optional. Message containing the poll from which the option was deleted, if known. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let pollMessage: TGMaybeInaccessibleMessage?

    /// Unique identifier of the deleted option
    public let optionPersistentId: String

    /// Option text
    public let optionText: String

    /// Optional. Special entities that appear in the option_text
    public let optionTextEntities: [TGMessageEntity]?

    public init (pollMessage: TGMaybeInaccessibleMessage? = nil, optionPersistentId: String, optionText: String, optionTextEntities: [TGMessageEntity]? = nil) {
        self.pollMessage = pollMessage
        self.optionPersistentId = optionPersistentId
        self.optionText = optionText
        self.optionTextEntities = optionTextEntities
    }
}
