// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about the users whose identifiers were shared with the bot using a KeyboardButtonRequestUsers button.

 SeeAlso Telegram Bot API Reference:
 [UsersShared](https://core.telegram.org/bots/api#usersshared)
 **/
public final class TGUsersShared: Codable, Sendable {

    /// Custom keys for coding/decoding `UsersShared` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case users = "users"
    }

    /// Identifier of the request
    public let requestId: Int

    /// Information about users shared with the bot.
    public let users: [TGSharedUser]

    public init (requestId: Int, users: [TGSharedUser]) {
        self.requestId = requestId
        self.users = users
    }
}
