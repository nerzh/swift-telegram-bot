// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the access settings of a bot.

 SeeAlso Telegram Bot API Reference:
 [BotAccessSettings](https://core.telegram.org/bots/api#botaccesssettings)
 **/
public final class TGBotAccessSettings: Codable, Sendable {

    /// Custom keys for coding/decoding `BotAccessSettings` struct
    public enum CodingKeys: String, CodingKey {
        case isAccessRestricted = "is_access_restricted"
        case addedUsers = "added_users"
    }

    /// True, if only selected users can access the bot. The bot's owner can always access it.
    public let isAccessRestricted: Bool

    /// Optional. The list of other users who have access to the bot if the access is restricted
    public let addedUsers: [TGUser]?

    public init (isAccessRestricted: Bool, addedUsers: [TGUser]? = nil) {
        self.isAccessRestricted = isAccessRestricted
        self.addedUsers = addedUsers
    }
}
