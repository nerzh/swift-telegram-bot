// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a chat.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#chat)
 **/
public final class TGChat: Codable, Sendable {

    /// Custom keys for coding/decoding `Chat` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case title = "title"
        case username = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case isForum = "is_forum"
        case isDirectMessages = "is_direct_messages"
    }

    /// Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public let id: Int64

    /// Type of the chat, can be either “private”, “group”, “supergroup” or “channel”
    public let type: TGChatType

    /// Optional. Title, for supergroups, channels and group chats
    public let title: String?

    /// Optional. Username, for private chats, supergroups and channels if available
    public let username: String?

    /// Optional. First name of the other party in a private chat
    public let firstName: String?

    /// Optional. Last name of the other party in a private chat
    public let lastName: String?

    /// Optional. True, if the supergroup chat is a forum (has topics enabled)
    public let isForum: Bool?

    /// Optional. True, if the chat is the direct messages chat of a channel
    public let isDirectMessages: Bool?

    public init (id: Int64, type: TGChatType, title: String? = nil, username: String? = nil, firstName: String? = nil, lastName: String? = nil, isForum: Bool? = nil, isDirectMessages: Bool? = nil) {
        self.id = id
        self.type = type
        self.title = title
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.isForum = isForum
        self.isDirectMessages = isDirectMessages
    }
}
