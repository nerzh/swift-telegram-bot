// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the bot's short description.

 SeeAlso Telegram Bot API Reference:
 [BotShortDescription](https://core.telegram.org/bots/api#botshortdescription)
 **/
public final class TGBotShortDescription: Codable, Sendable {

    /// Custom keys for coding/decoding `BotShortDescription` struct
    public enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
    }

    /// The bot's short description
    public let shortDescription: String

    public init (shortDescription: String) {
        self.shortDescription = shortDescription
    }
}
