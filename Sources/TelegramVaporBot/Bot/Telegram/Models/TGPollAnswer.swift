// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents an answer of a user in a non-anonymous poll.

 SeeAlso Telegram Bot API Reference:
 [PollAnswer](https://core.telegram.org/bots/api#pollanswer)
 */
public final class TGPollAnswer: Codable {

    /// Custom keys for coding/decoding `PollAnswer` struct
    public enum CodingKeys: String, CodingKey {
        case pollId = "poll_id"
        case user = "user"
        case optionIds = "option_ids"
    }

    /// Unique poll identifier
    public var pollId: String

    /// The user, who changed the answer to the poll
    public var user: TGUser

    /// 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.
    public var optionIds: [Int]

    public init (pollId: String, user: TGUser, optionIds: [Int]) {
        self.pollId = pollId
        self.user = user
        self.optionIds = optionIds
    }
}
