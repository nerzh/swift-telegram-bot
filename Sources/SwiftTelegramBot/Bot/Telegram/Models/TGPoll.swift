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
        case allowsRevoting = "allows_revoting"
        case membersOnly = "members_only"
        case countryCodes = "country_codes"
        case correctOptionIds = "correct_option_ids"
        case explanation = "explanation"
        case explanationEntities = "explanation_entities"
        case explanationMedia = "explanation_media"
        case openPeriod = "open_period"
        case closeDate = "close_date"
        case description = "description"
        case descriptionEntities = "description_entities"
        case media = "media"
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

    /// True, if the poll allows to change the chosen answer options
    public let allowsRevoting: Bool

    /// True if voting is limited to users who have been members of the chat where the poll was originally sent for more than 24 hours
    public let membersOnly: Bool

    /// Optional. A list of two-letter ISO 3166-1 alpha-2 country codes indicating the countries from which users can vote in the poll. The country code “FT” is used for users with anonymous numbers. If omitted, then users from any country can participate in the poll.
    public let countryCodes: [String]?

    /// Optional. Array of 0-based identifiers of the correct answer options. Available only for polls in quiz mode which are closed or were sent (not forwarded) by the bot or to the private chat with the bot.
    public let correctOptionIds: [Int]?

    /// Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    public let explanation: String?

    /// Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the explanation
    public let explanationEntities: [TGMessageEntity]?

    /// Optional. Media added to the quiz explanation
    public let explanationMedia: TGPollMedia?

    /// Optional. Amount of time in seconds the poll will be active after creation
    public let openPeriod: Int?

    /// Optional. Point in time (Unix timestamp) when the poll will be automatically closed
    public let closeDate: Int?

    /// Optional. Description of the poll; for polls inside the Message object only
    public let description: String?

    /// Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the description
    public let descriptionEntities: [TGMessageEntity]?

    /// Optional. Media added to the poll description; for polls inside the Message object only
    public let media: TGPollMedia?

    public init (id: String, question: String, questionEntities: [TGMessageEntity]? = nil, options: [TGPollOption], totalVoterCount: Int, isClosed: Bool, isAnonymous: Bool, type: TGPollType, allowsMultipleAnswers: Bool, allowsRevoting: Bool, membersOnly: Bool, countryCodes: [String]? = nil, correctOptionIds: [Int]? = nil, explanation: String? = nil, explanationEntities: [TGMessageEntity]? = nil, explanationMedia: TGPollMedia? = nil, openPeriod: Int? = nil, closeDate: Int? = nil, description: String? = nil, descriptionEntities: [TGMessageEntity]? = nil, media: TGPollMedia? = nil) {
        self.id = id
        self.question = question
        self.questionEntities = questionEntities
        self.options = options
        self.totalVoterCount = totalVoterCount
        self.isClosed = isClosed
        self.isAnonymous = isAnonymous
        self.type = type
        self.allowsMultipleAnswers = allowsMultipleAnswers
        self.allowsRevoting = allowsRevoting
        self.membersOnly = membersOnly
        self.countryCodes = countryCodes
        self.correctOptionIds = correctOptionIds
        self.explanation = explanation
        self.explanationEntities = explanationEntities
        self.explanationMedia = explanationMedia
        self.openPeriod = openPeriod
        self.closeDate = closeDate
        self.description = description
        self.descriptionEntities = descriptionEntities
        self.media = media
    }
}
