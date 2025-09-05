// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the connection of the bot with a business account.

 SeeAlso Telegram Bot API Reference:
 [BusinessConnection](https://core.telegram.org/bots/api#businessconnection)
 **/
public final class TGBusinessConnection: Codable, Sendable {

    /// Custom keys for coding/decoding `BusinessConnection` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
        case userChatId = "user_chat_id"
        case date = "date"
        case rights = "rights"
        case isEnabled = "is_enabled"
    }

    /// Unique identifier of the business connection
    public let id: String

    /// Business account user that created the business connection
    public let user: TGUser

    /// Identifier of a private chat with the user who created the business connection. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    public let userChatId: Int64

    /// Date the connection was established in Unix time
    public let date: Int

    /// Optional. Rights of the business bot
    public let rights: TGBusinessBotRights?

    /// True, if the connection is active
    public let isEnabled: Bool

    public init (id: String, user: TGUser, userChatId: Int64, date: Int, rights: TGBusinessBotRights? = nil, isEnabled: Bool) {
        self.id = id
        self.user = user
        self.userChatId = userChatId
        self.date = date
        self.rights = rights
        self.isEnabled = isEnabled
    }
}
