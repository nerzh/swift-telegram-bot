// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about the bot that was created to be managed by the current bot.

 SeeAlso Telegram Bot API Reference:
 [ManagedBotCreated](https://core.telegram.org/bots/api#managedbotcreated)
 **/
public final class TGManagedBotCreated: Codable, Sendable {

    /// Custom keys for coding/decoding `ManagedBotCreated` struct
    public enum CodingKeys: String, CodingKey {
        case bot = "bot"
    }

    /// Information about the bot. The bot's token can be fetched using the method getManagedBotToken.
    public let bot: TGUser

    public init (bot: TGUser) {
        self.bot = bot
    }
}
