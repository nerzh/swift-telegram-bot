// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about an option added to a poll.

 SeeAlso Telegram Bot API Reference:
 [PollOptionAdded](https://core.telegram.org/bots/api#polloptionadded)
 **/
public final class TGPollOptionAdded: Codable, Sendable {

    /// Custom keys for coding/decoding `PollOptionAdded` struct
    public enum CodingKeys: String, CodingKey {
        case pollMessage = "poll_message"
        case optionPersistentId = "option_persistent_id"
        case optionText = "option_text"
        case optionTextEntities = "option_text_entities"
    }

    /// Optional. Message containing the poll to which the option was added, if known. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let pollMessage: TGMaybeInaccessibleMessage?

    /// Unique identifier of the added option
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
