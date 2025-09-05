// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an answer of a user in a non-anonymous poll.

 SeeAlso Telegram Bot API Reference:
 [PollAnswer](https://core.telegram.org/bots/api#pollanswer)
 **/
public final class TGPollAnswer: Codable, Sendable {

    /// Custom keys for coding/decoding `PollAnswer` struct
    public enum CodingKeys: String, CodingKey {
        case pollId = "poll_id"
        case voterChat = "voter_chat"
        case user = "user"
        case optionIds = "option_ids"
    }

    /// Unique poll identifier
    public let pollId: String

    /// Optional. The chat that changed the answer to the poll, if the voter is anonymous
    public let voterChat: TGChat?

    /// Optional. The user that changed the answer to the poll, if the voter isn't anonymous
    public let user: TGUser?

    /// 0-based identifiers of chosen answer options. May be empty if the vote was retracted.
    public let optionIds: [Int]

    public init (pollId: String, voterChat: TGChat? = nil, user: TGUser? = nil, optionIds: [Int]) {
        self.pollId = pollId
        self.voterChat = voterChat
        self.user = user
        self.optionIds = optionIds
    }
}
