// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a poll.

 SeeAlso Telegram Bot API Reference:
 [Poll](https://core.telegram.org/bots/api#poll)
 **/
public final class TGPoll: Codable, Sendable {

    /// Custom keys for coding/decoding `Poll` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case question = "question"
        case questionEntities = "question_entities"
        case options = "options"
        case totalVoterCount = "total_voter_count"
        case isClosed = "is_closed"
        case isAnonymous = "is_anonymous"
        case type = "type"
        case allowsMultipleAnswers = "allows_multiple_answers"
        case correctOptionId = "correct_option_id"
        case explanation = "explanation"
        case explanationEntities = "explanation_entities"
        case openPeriod = "open_period"
        case closeDate = "close_date"
    }

    /// Unique poll identifier
    public let id: String

    /// Poll question, 1-300 characters
    public let question: String

    /// Optional. Special entities that appear in the question. Currently, only custom emoji entities are allowed in poll questions
    public let questionEntities: [TGMessageEntity]?

    /// List of poll options
    public let options: [TGPollOption]

    /// Total number of users that voted in the poll
    public let totalVoterCount: Int

    /// True, if the poll is closed
    public let isClosed: Bool

    /// True, if the poll is anonymous
    public let isAnonymous: Bool

    /// Poll type, currently can be “regular” or “quiz”
    public let type: TGPollType

    /// True, if the poll allows multiple answers
    public let allowsMultipleAnswers: Bool

    /// Optional. 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot.
    public let correctOptionId: Int?

    /// Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    public let explanation: String?

    /// Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the explanation
    public let explanationEntities: [TGMessageEntity]?

    /// Optional. Amount of time in seconds the poll will be active after creation
    public let openPeriod: Int?

    /// Optional. Point in time (Unix timestamp) when the poll will be automatically closed
    public let closeDate: Int?

    public init (id: String, question: String, questionEntities: [TGMessageEntity]? = nil, options: [TGPollOption], totalVoterCount: Int, isClosed: Bool, isAnonymous: Bool, type: TGPollType, allowsMultipleAnswers: Bool, correctOptionId: Int? = nil, explanation: String? = nil, explanationEntities: [TGMessageEntity]? = nil, openPeriod: Int? = nil, closeDate: Int? = nil) {
        self.id = id
        self.question = question
        self.questionEntities = questionEntities
        self.options = options
        self.totalVoterCount = totalVoterCount
        self.isClosed = isClosed
        self.isAnonymous = isAnonymous
        self.type = type
        self.allowsMultipleAnswers = allowsMultipleAnswers
        self.correctOptionId = correctOptionId
        self.explanation = explanation
        self.explanationEntities = explanationEntities
        self.openPeriod = openPeriod
        self.closeDate = closeDate
    }
}
