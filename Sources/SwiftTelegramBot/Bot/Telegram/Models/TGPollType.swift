// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about a poll.

 SeeAlso Telegram Bot API Reference:
 [Poll](https://core.telegram.org/bots/api#poll)
 */

public enum TGPollType: String, Codable, Sendable {
    case regular = "regular"
    case quiz = "quiz"
}