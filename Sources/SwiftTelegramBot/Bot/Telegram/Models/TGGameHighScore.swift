// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents one row of the high scores table for a game.

 SeeAlso Telegram Bot API Reference:
 [GameHighScore](https://core.telegram.org/bots/api#gamehighscore)
 **/
public final class TGGameHighScore: Codable, Sendable {

    /// Custom keys for coding/decoding `GameHighScore` struct
    public enum CodingKeys: String, CodingKey {
        case position = "position"
        case user = "user"
        case score = "score"
    }

    /// Position in high score table for the game
    public let position: Int

    /// User
    public let user: TGUser

    /// Score
    public let score: Int

    public init (position: Int, user: TGUser, score: Int) {
        self.position = position
        self.user = user
        self.score = score
    }
}
