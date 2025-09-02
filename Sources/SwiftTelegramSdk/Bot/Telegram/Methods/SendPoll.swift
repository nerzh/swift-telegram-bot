// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send a native poll. On success, the sent Message is returned.


/// Parameters container struct for `sendPoll` method
public struct TGSendPollParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername). Polls can't be sent to channel direct messages chats.
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public let messageThreadId: Int?

    /// Poll question, 1-300 characters
    public let question: String

    /// Mode for parsing entities in the question. See formatting options for more details. Currently, only custom emoji entities are allowed
    public let questionParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the poll question. It can be specified instead of question_parse_mode
    public let questionEntities: [TGMessageEntity]?

    /// A JSON-serialized list of 2-12 answer options
    public let options: [TGInputPollOption]

    /// True, if the poll needs to be anonymous, defaults to True
    public let isAnonymous: Bool?

    /// Poll type, “quiz” or “regular”, defaults to “regular”
    public let type: String?

    /// True, if the poll allows multiple answers, ignored for polls in quiz mode, defaults to False
    public let allowsMultipleAnswers: Bool?

    /// 0-based identifier of the correct answer option, required for polls in quiz mode
    public let correctOptionId: Int?

    /// Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters with at most 2 line feeds after entities parsing
    public let explanation: String?

    /// Mode for parsing entities in the explanation. See formatting options for more details.
    public let explanationParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the poll explanation. It can be specified instead of explanation_parse_mode
    public let explanationEntities: [TGMessageEntity]?

    /// Amount of time in seconds the poll will be active after creation, 5-600. Can't be used together with close_date.
    public let openPeriod: Int?

    /// Point in time (Unix timestamp) when the poll will be automatically closed. Must be at least 5 and no more than 600 seconds in the future. Can't be used together with open_period.
    public let closeDate: Int?

    /// Pass True if the poll needs to be immediately closed. This can be useful for poll preview.
    public let isClosed: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public let protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance
    public let allowPaidBroadcast: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public let messageEffectId: String?

    /// Description of the message to reply to
    public let replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user
    public let replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendPollParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case question = "question"
            case questionParseMode = "question_parse_mode"
            case questionEntities = "question_entities"
            case options = "options"
            case isAnonymous = "is_anonymous"
            case type = "type"
            case allowsMultipleAnswers = "allows_multiple_answers"
            case correctOptionId = "correct_option_id"
            case explanation = "explanation"
            case explanationParseMode = "explanation_parse_mode"
            case explanationEntities = "explanation_entities"
            case openPeriod = "open_period"
            case closeDate = "close_date"
            case isClosed = "is_closed"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, question: String, questionParseMode: TGParseMode? = nil, questionEntities: [TGMessageEntity]? = nil, options: [TGInputPollOption], isAnonymous: Bool? = nil, type: String? = nil, allowsMultipleAnswers: Bool? = nil, correctOptionId: Int? = nil, explanation: String? = nil, explanationParseMode: TGParseMode? = nil, explanationEntities: [TGMessageEntity]? = nil, openPeriod: Int? = nil, closeDate: Int? = nil, isClosed: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.question = question
            self.questionParseMode = questionParseMode
            self.questionEntities = questionEntities
            self.options = options
            self.isAnonymous = isAnonymous
            self.type = type
            self.allowsMultipleAnswers = allowsMultipleAnswers
            self.correctOptionId = correctOptionId
            self.explanation = explanation
            self.explanationParseMode = explanationParseMode
            self.explanationEntities = explanationEntities
            self.openPeriod = openPeriod
            self.closeDate = closeDate
            self.isClosed = isClosed
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.allowPaidBroadcast = allowPaidBroadcast
            self.messageEffectId = messageEffectId
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send a native poll. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendPollParams](https://core.telegram.org/bots/api#sendpoll)
 
 - Parameters:
     - params: Parameters container, see `SendPollParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendPoll(params: TGSendPollParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendPoll")) else {
            throw BotError("Bad URL: \(getMethodURL("sendPoll"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
