// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a Telegram user or bot.

 SeeAlso Telegram Bot API Reference:
 [User](https://core.telegram.org/bots/api#user)
 **/
public final class TGUser: Codable, Sendable {

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
        case canConnectToBusiness = "can_connect_to_business"
        case hasMainWebApp = "has_main_web_app"
        case hasTopicsEnabled = "has_topics_enabled"
        case allowsUsersToCreateTopics = "allows_users_to_create_topics"
    }

    /// Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    public let id: Int64

    /// True, if this user is a bot
    public let isBot: Bool

    /// User's or bot's first name
    public let firstName: String

    /// Optional. User's or bot's last name
    public let lastName: String?

    /// Optional. User's or bot's username
    public let username: String?

    /// Optional. IETF language tag of the user's language
    public let languageCode: String?

    /// Optional. True, if this user is a Telegram Premium user
    public let isPremium: Bool?

    /// Optional. True, if this user added the bot to the attachment menu
    public let addedToAttachmentMenu: Bool?

    /// Optional. True, if the bot can be invited to groups. Returned only in getMe.
    public let canJoinGroups: Bool?

    /// Optional. True, if privacy mode is disabled for the bot. Returned only in getMe.
    public let canReadAllGroupMessages: Bool?

    /// Optional. True, if the bot supports inline queries. Returned only in getMe.
    public let supportsInlineQueries: Bool?

    /// Optional. True, if the bot can be connected to a Telegram Business account to receive its messages. Returned only in getMe.
    public let canConnectToBusiness: Bool?

    /// Optional. True, if the bot has a main Web App. Returned only in getMe.
    public let hasMainWebApp: Bool?

    /// Optional. True, if the bot has forum topic mode enabled in private chats. Returned only in getMe.
    public let hasTopicsEnabled: Bool?

    /// Optional. True, if the bot allows users to create and delete topics in private chats. Returned only in getMe.
    public let allowsUsersToCreateTopics: Bool?

    public init (id: Int64, isBot: Bool, firstName: String, lastName: String? = nil, username: String? = nil, languageCode: String? = nil, isPremium: Bool? = nil, addedToAttachmentMenu: Bool? = nil, canJoinGroups: Bool? = nil, canReadAllGroupMessages: Bool? = nil, supportsInlineQueries: Bool? = nil, canConnectToBusiness: Bool? = nil, hasMainWebApp: Bool? = nil, hasTopicsEnabled: Bool? = nil, allowsUsersToCreateTopics: Bool? = nil) {
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
        self.canConnectToBusiness = canConnectToBusiness
        self.hasMainWebApp = hasMainWebApp
        self.hasTopicsEnabled = hasTopicsEnabled
        self.allowsUsersToCreateTopics = allowsUsersToCreateTopics
    }
}
