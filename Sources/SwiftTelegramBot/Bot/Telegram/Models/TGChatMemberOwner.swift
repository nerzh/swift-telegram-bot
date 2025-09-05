// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that owns the chat and has all administrator privileges.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberOwner](https://core.telegram.org/bots/api#chatmemberowner)
 **/
public final class TGChatMemberOwner: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatMemberOwner` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case isAnonymous = "is_anonymous"
        case customTitle = "custom_title"
    }

    /// The member's status in the chat, always “creator”
    public let status: String

    /// Information about the user
    public let user: TGUser

    /// True, if the user's presence in the chat is hidden
    public let isAnonymous: Bool

    /// Optional. Custom title for this user
    public let customTitle: String?

    public init (status: String, user: TGUser, isAnonymous: Bool, customTitle: String? = nil) {
        self.status = status
        self.user = user
        self.isAnonymous = isAnonymous
        self.customTitle = customTitle
    }
}
