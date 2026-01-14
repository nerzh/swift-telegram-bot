// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the rating of a user based on their Telegram Star spendings.

 SeeAlso Telegram Bot API Reference:
 [UserRating](https://core.telegram.org/bots/api#userrating)
 **/
public final class TGUserRating: Codable, Sendable {

    /// Custom keys for coding/decoding `UserRating` struct
    public enum CodingKeys: String, CodingKey {
        case level = "level"
        case rating = "rating"
        case currentLevelRating = "current_level_rating"
        case nextLevelRating = "next_level_rating"
    }

    /// Current level of the user, indicating their reliability when purchasing digital goods and services. A higher level suggests a more trustworthy customer; a negative level is likely reason for concern.
    public let level: Int

    /// Numerical value of the user's rating; the higher the rating, the better
    public let rating: Int

    /// The rating value required to get the current level
    public let currentLevelRating: Int

    /// Optional. The rating value required to get to the next level; omitted if the maximum level was reached
    public let nextLevelRating: Int?

    public init (level: Int, rating: Int, currentLevelRating: Int, nextLevelRating: Int? = nil) {
        self.level = level
        self.rating = rating
        self.currentLevelRating = currentLevelRating
        self.nextLevelRating = nextLevelRating
    }
}
