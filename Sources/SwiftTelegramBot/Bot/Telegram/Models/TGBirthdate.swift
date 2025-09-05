// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the birthdate of a user.

 SeeAlso Telegram Bot API Reference:
 [Birthdate](https://core.telegram.org/bots/api#birthdate)
 **/
public final class TGBirthdate: Codable, Sendable {

    /// Custom keys for coding/decoding `Birthdate` struct
    public enum CodingKeys: String, CodingKey {
        case day = "day"
        case month = "month"
        case year = "year"
    }

    /// Day of the user's birth; 1-31
    public let day: Int

    /// Month of the user's birth; 1-12
    public let month: Int

    /// Optional. Year of the user's birth
    public let year: Int?

    public init (day: Int, month: Int, year: Int? = nil) {
        self.day = day
        self.month = month
        self.year = year
    }
}
