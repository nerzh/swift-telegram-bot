// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a chat.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#chat)
 */
public final class TGChat: Codable {

    /// Custom keys for coding/decoding `Chat` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case title = "title"
        case username = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case isForum = "is_forum"
        case photo = "photo"
        case activeUsernames = "active_usernames"
        case emojiStatusCustomEmojiId = "emoji_status_custom_emoji_id"
        case bio = "bio"
        case hasPrivateForwards = "has_private_forwards"
        case hasRestrictedVoiceAndVideoMessages = "has_restricted_voice_and_video_messages"
        case joinToSendMessages = "join_to_send_messages"
        case joinByRequest = "join_by_request"
        case description = "description"
        case inviteLink = "invite_link"
        case pinnedMessage = "pinned_message"
        case permissions = "permissions"
        case slowModeDelay = "slow_mode_delay"
        case messageAutoDeleteTime = "message_auto_delete_time"
        case hasProtectedContent = "has_protected_content"
        case stickerSetName = "sticker_set_name"
        case canSetStickerSet = "can_set_sticker_set"
        case linkedChatId = "linked_chat_id"
        case location = "location"
    }

    /// Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public var id: Int64

    /// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
    public var type: TGChatType

    /// Optional. Title, for supergroups, channels and group chats
    public var title: String?

    /// Optional. Username, for private chats, supergroups and channels if available
    public var username: String?

    /// Optional. First name of the other party in a private chat
    public var firstName: String?

    /// Optional. Last name of the other party in a private chat
    public var lastName: String?

    /// Optional. True, if the supergroup chat is a forum (has topics enabled)
    public var isForum: Bool?

    /// Optional. Chat photo. Returned only in getChat.
    public var photo: TGChatPhoto?

    /// Optional. If non-empty, the list of all active chat usernames; for private chats, supergroups and channels. Returned only in getChat.
    public var activeUsernames: [String]?

    /// Optional. Custom emoji identifier of emoji status of the other party in a private chat. Returned only in getChat.
    public var emojiStatusCustomEmojiId: String?

    /// Optional. Bio of the other party in a private chat. Returned only in getChat.
    public var bio: String?

    /// Optional. True, if privacy settings of the other party in the private chat allows to use tg://user?id=<user_id> links only in chats with the user. Returned only in getChat.
    public var hasPrivateForwards: Bool?

    /// Optional. True, if the privacy settings of the other party restrict sending voice and video note messages in the private chat. Returned only in getChat.
    public var hasRestrictedVoiceAndVideoMessages: Bool?

    /// Optional. True, if users need to join the supergroup before they can send messages. Returned only in getChat.
    public var joinToSendMessages: Bool?

    /// Optional. True, if all users directly joining the supergroup need to be approved by supergroup administrators. Returned only in getChat.
    public var joinByRequest: Bool?

    /// Optional. Description, for groups, supergroups and channel chats. Returned only in getChat.
    public var description: String?

    /// Optional. Primary invite link, for groups, supergroups and channel chats. Returned only in getChat.
    public var inviteLink: String?

    /// Optional. The most recent pinned message (by sending date). Returned only in getChat.
    public var pinnedMessage: TGMessage?

    /// Optional. Default chat member permissions, for groups and supergroups. Returned only in getChat.
    public var permissions: TGChatPermissions?

    /// Optional. For supergroups, the minimum allowed delay between consecutive messages sent by each unpriviledged user; in seconds. Returned only in getChat.
    public var slowModeDelay: Int?

    /// Optional. The time after which all messages sent to the chat will be automatically deleted; in seconds. Returned only in getChat.
    public var messageAutoDeleteTime: Int?

    /// Optional. True, if messages from the chat can't be forwarded to other chats. Returned only in getChat.
    public var hasProtectedContent: Bool?

    /// Optional. For supergroups, name of group sticker set. Returned only in getChat.
    public var stickerSetName: String?

    /// Optional. True, if the bot can change the group sticker set. Returned only in getChat.
    public var canSetStickerSet: Bool?

    /// Optional. Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier. Returned only in getChat.
    public var linkedChatId: Int64?

    /// Optional. For supergroups, the location to which the supergroup is connected. Returned only in getChat.
    public var location: TGChatLocation?

    public init (id: Int64, type: TGChatType, title: String? = nil, username: String? = nil, firstName: String? = nil, lastName: String? = nil, isForum: Bool? = nil, photo: TGChatPhoto? = nil, activeUsernames: [String]? = nil, emojiStatusCustomEmojiId: String? = nil, bio: String? = nil, hasPrivateForwards: Bool? = nil, hasRestrictedVoiceAndVideoMessages: Bool? = nil, joinToSendMessages: Bool? = nil, joinByRequest: Bool? = nil, description: String? = nil, inviteLink: String? = nil, pinnedMessage: TGMessage? = nil, permissions: TGChatPermissions? = nil, slowModeDelay: Int? = nil, messageAutoDeleteTime: Int? = nil, hasProtectedContent: Bool? = nil, stickerSetName: String? = nil, canSetStickerSet: Bool? = nil, linkedChatId: Int64? = nil, location: TGChatLocation? = nil) {
        self.id = id
        self.type = type
        self.title = title
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.isForum = isForum
        self.photo = photo
        self.activeUsernames = activeUsernames
        self.emojiStatusCustomEmojiId = emojiStatusCustomEmojiId
        self.bio = bio
        self.hasPrivateForwards = hasPrivateForwards
        self.hasRestrictedVoiceAndVideoMessages = hasRestrictedVoiceAndVideoMessages
        self.joinToSendMessages = joinToSendMessages
        self.joinByRequest = joinByRequest
        self.description = description
        self.inviteLink = inviteLink
        self.pinnedMessage = pinnedMessage
        self.permissions = permissions
        self.slowModeDelay = slowModeDelay
        self.messageAutoDeleteTime = messageAutoDeleteTime
        self.hasProtectedContent = hasProtectedContent
        self.stickerSetName = stickerSetName
        self.canSetStickerSet = canSetStickerSet
        self.linkedChatId = linkedChatId
        self.location = location
    }
}
