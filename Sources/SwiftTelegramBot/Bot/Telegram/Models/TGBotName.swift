// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the bot's name.

 SeeAlso Telegram Bot API Reference:
 [BotName](https://core.telegram.org/bots/api#botname)
 **/
public final class TGBotName: Codable, Sendable {

    /// Custom keys for coding/decoding `BotName` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
    }

    /// The bot's name
    public let name: String

    public init (name: String) {
        self.name = name
    }
}
