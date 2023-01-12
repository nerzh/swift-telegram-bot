// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a Telegram user or bot.

 SeeAlso Telegram Bot API Reference:
 [User](https://core.telegram.org/bots/api#user)
 */
public final class TGUser: Codable {

    /// Custom keys for coding/decoding `User` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case isBot = "is_bot"
        case firstName = "first_name"
        case lastName = "last_name"
        case username = "username"
        case languageCode = "language_code"
        case isPremium = "is_premium"
        case addedToAttachmentMenu = "added_to_attachment_menu"
        case canJoinGroups = "can_join_groups"
        case canReadAllGroupMessages = "can_read_all_group_messages"
        case supportsInlineQueries = "supports_inline_queries"
    }

    /// Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    public var id: Int64

    /// True, if this user is a bot
    public var isBot: Bool

    /// User's or bot's first name
    public var firstName: String

    /// Optional. User's or bot's last name
    public var lastName: String?

    /// Optional. User's or bot's username
    public var username: String?

    /// Optional. IETF language tag of the user's language
    public var languageCode: String?

    /// Optional. True, if this user is a Telegram Premium user
    public var isPremium: Bool?

    /// Optional. True, if this user added the bot to the attachment menu
    public var addedToAttachmentMenu: Bool?

    /// Optional. True, if the bot can be invited to groups. Returned only in getMe.
    public var canJoinGroups: Bool?

    /// Optional. True, if privacy mode is disabled for the bot. Returned only in getMe.
    public var canReadAllGroupMessages: Bool?

    /// Optional. True, if the bot supports inline queries. Returned only in getMe.
    public var supportsInlineQueries: Bool?

    public init (id: Int64, isBot: Bool, firstName: String, lastName: String? = nil, username: String? = nil, languageCode: String? = nil, isPremium: Bool? = nil, addedToAttachmentMenu: Bool? = nil, canJoinGroups: Bool? = nil, canReadAllGroupMessages: Bool? = nil, supportsInlineQueries: Bool? = nil) {
        self.id = id
        self.isBot = isBot
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.languageCode = languageCode
        self.isPremium = isPremium
        self.addedToAttachmentMenu = addedToAttachmentMenu
        self.canJoinGroups = canJoinGroups
        self.canReadAllGroupMessages = canReadAllGroupMessages
        self.supportsInlineQueries = supportsInlineQueries
    }
}
