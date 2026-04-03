// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about the creation or token update of a bot that is managed by the current bot.

 SeeAlso Telegram Bot API Reference:
 [ManagedBotUpdated](https://core.telegram.org/bots/api#managedbotupdated)
 **/
public final class TGManagedBotUpdated: Codable, Sendable {

    /// Custom keys for coding/decoding `ManagedBotUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case user = "user"
        case bot = "bot"
    }

    /// User that created the bot
    public let user: TGUser

    /// Information about the bot. Token of the bot can be fetched using the method getManagedBotToken.
    public let bot: TGUser

    public init (user: TGUser, bot: TGUser) {
        self.user = user
        self.bot = bot
    }
}
