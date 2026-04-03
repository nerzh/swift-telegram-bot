// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about one answer option in a poll.

 SeeAlso Telegram Bot API Reference:
 [PollOption](https://core.telegram.org/bots/api#polloption)
 **/
public final class TGPollOption: Codable, Sendable {

    /// Custom keys for coding/decoding `PollOption` struct
    public enum CodingKeys: String, CodingKey {
        case persistentId = "persistent_id"
        case text = "text"
        case textEntities = "text_entities"
        case voterCount = "voter_count"
        case addedByUser = "added_by_user"
        case addedByChat = "added_by_chat"
        case additionDate = "addition_date"
    }

    /// Unique identifier of the option, persistent on option addition and deletion
    public let persistentId: String

    /// Option text, 1-100 characters
    public let text: String

    /// Optional. Special entities that appear in the option text. Currently, only custom emoji entities are allowed in poll option texts
    public let textEntities: [TGMessageEntity]?

    /// Number of users who voted for this option; may be 0 if unknown
    public let voterCount: Int

    /// Optional. User who added the option; omitted if the option wasn't added by a user after poll creation
    public let addedByUser: TGUser?

    /// Optional. Chat that added the option; omitted if the option wasn't added by a chat after poll creation
    public let addedByChat: TGChat?

    /// Optional. Point in time (Unix timestamp) when the option was added; omitted if the option existed in the original poll
    public let additionDate: Int?

    public init (persistentId: String, text: String, textEntities: [TGMessageEntity]? = nil, voterCount: Int, addedByUser: TGUser? = nil, addedByChat: TGChat? = nil, additionDate: Int? = nil) {
        self.persistentId = persistentId
        self.text = text
        self.textEntities = textEntities
        self.voterCount = voterCount
        self.addedByUser = addedByUser
        self.addedByChat = addedByChat
        self.additionDate = additionDate
    }
}
