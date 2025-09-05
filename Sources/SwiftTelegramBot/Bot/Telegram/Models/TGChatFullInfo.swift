// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains full information about a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatFullInfo](https://core.telegram.org/bots/api#chatfullinfo)
 **/
public final class TGChatFullInfo: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatFullInfo` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case title = "title"
        case username = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case isForum = "is_forum"
        case isDirectMessages = "is_direct_messages"
        case accentColorId = "accent_color_id"
        case maxReactionCount = "max_reaction_count"
        case photo = "photo"
        case activeUsernames = "active_usernames"
        case birthdate = "birthdate"
        case businessIntro = "business_intro"
        case businessLocation = "business_location"
        case businessOpeningHours = "business_opening_hours"
        case personalChat = "personal_chat"
        case parentChat = "parent_chat"
        case availableReactions = "available_reactions"
        case backgroundCustomEmojiId = "background_custom_emoji_id"
        case profileAccentColorId = "profile_accent_color_id"
        case profileBackgroundCustomEmojiId = "profile_background_custom_emoji_id"
        case emojiStatusCustomEmojiId = "emoji_status_custom_emoji_id"
        case emojiStatusExpirationDate = "emoji_status_expiration_date"
        case bio = "bio"
        case hasPrivateForwards = "has_private_forwards"
        case hasRestrictedVoiceAndVideoMessages = "has_restricted_voice_and_video_messages"
        case joinToSendMessages = "join_to_send_messages"
        case joinByRequest = "join_by_request"
        case description = "description"
        case inviteLink = "invite_link"
        case pinnedMessage = "pinned_message"
        case permissions = "permissions"
        case acceptedGiftTypes = "accepted_gift_types"
        case canSendPaidMedia = "can_send_paid_media"
        case slowModeDelay = "slow_mode_delay"
        case unrestrictBoostCount = "unrestrict_boost_count"
        case messageAutoDeleteTime = "message_auto_delete_time"
        case hasAggressiveAntiSpamEnabled = "has_aggressive_anti_spam_enabled"
        case hasHiddenMembers = "has_hidden_members"
        case hasProtectedContent = "has_protected_content"
        case hasVisibleHistory = "has_visible_history"
        case stickerSetName = "sticker_set_name"
        case canSetStickerSet = "can_set_sticker_set"
        case customEmojiStickerSetName = "custom_emoji_sticker_set_name"
        case linkedChatId = "linked_chat_id"
        case location = "location"
    }

    /// Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public let id: Int

    /// Type of the chat, can be either “private”, “group”, “supergroup” or “channel”
    public let type: TGChatFullInfoType

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

    /// Identifier of the accent color for the chat name and backgrounds of the chat photo, reply header, and link preview. See accent colors for more details.
    public let accentColorId: Int

    /// The maximum number of reactions that can be set on a message in the chat
    public let maxReactionCount: Int

    /// Optional. Chat photo
    public let photo: TGChatPhoto?

    /// Optional. If non-empty, the list of all active chat usernames; for private chats, supergroups and channels
    public let activeUsernames: [String]?

    /// Optional. For private chats, the date of birth of the user
    public let birthdate: TGBirthdate?

    /// Optional. For private chats with business accounts, the intro of the business
    public let businessIntro: TGBusinessIntro?

    /// Optional. For private chats with business accounts, the location of the business
    public let businessLocation: TGBusinessLocation?

    /// Optional. For private chats with business accounts, the opening hours of the business
    public let businessOpeningHours: TGBusinessOpeningHours?

    /// Optional. For private chats, the personal channel of the user
    public let personalChat: TGChat?

    /// Optional. Information about the corresponding channel chat; for direct messages chats only
    public let parentChat: TGChat?

    /// Optional. List of available reactions allowed in the chat. If omitted, then all emoji reactions are allowed.
    public let availableReactions: [TGReactionType]?

    /// Optional. Custom emoji identifier of the emoji chosen by the chat for the reply header and link preview background
    public let backgroundCustomEmojiId: String?

    /// Optional. Identifier of the accent color for the chat's profile background. See profile accent colors for more details.
    public let profileAccentColorId: Int?

    /// Optional. Custom emoji identifier of the emoji chosen by the chat for its profile background
    public let profileBackgroundCustomEmojiId: String?

    /// Optional. Custom emoji identifier of the emoji status of the chat or the other party in a private chat
    public let emojiStatusCustomEmojiId: String?

    /// Optional. Expiration date of the emoji status of the chat or the other party in a private chat, in Unix time, if any
    public let emojiStatusExpirationDate: Int?

    /// Optional. Bio of the other party in a private chat
    public let bio: String?

    /// Optional. True, if privacy settings of the other party in the private chat allows to use tg://user?id=<user_id> links only in chats with the user
    public let hasPrivateForwards: Bool?

    /// Optional. True, if the privacy settings of the other party restrict sending voice and video note messages in the private chat
    public let hasRestrictedVoiceAndVideoMessages: Bool?

    /// Optional. True, if users need to join the supergroup before they can send messages
    public let joinToSendMessages: Bool?

    /// Optional. True, if all users directly joining the supergroup without using an invite link need to be approved by supergroup administrators
    public let joinByRequest: Bool?

    /// Optional. Description, for groups, supergroups and channel chats
    public let description: String?

    /// Optional. Primary invite link, for groups, supergroups and channel chats
    public let inviteLink: String?

    /// Optional. The most recent pinned message (by sending date)
    public let pinnedMessage: TGMessage?

    /// Optional. Default chat member permissions, for groups and supergroups
    public let permissions: TGChatPermissions?

    /// Information about types of gifts that are accepted by the chat or by the corresponding user for private chats
    public let acceptedGiftTypes: TGAcceptedGiftTypes

    /// Optional. True, if paid media messages can be sent or forwarded to the channel chat. The field is available only for channel chats.
    public let canSendPaidMedia: Bool?

    /// Optional. For supergroups, the minimum allowed delay between consecutive messages sent by each unprivileged user; in seconds
    public let slowModeDelay: Int?

    /// Optional. For supergroups, the minimum number of boosts that a non-administrator user needs to add in order to ignore slow mode and chat permissions
    public let unrestrictBoostCount: Int?

    /// Optional. The time after which all messages sent to the chat will be automatically deleted; in seconds
    public let messageAutoDeleteTime: Int?

    /// Optional. True, if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators.
    public let hasAggressiveAntiSpamEnabled: Bool?

    /// Optional. True, if non-administrators can only get the list of bots and administrators in the chat
    public let hasHiddenMembers: Bool?

    /// Optional. True, if messages from the chat can't be forwarded to other chats
    public let hasProtectedContent: Bool?

    /// Optional. True, if new chat members will have access to old messages; available only to chat administrators
    public let hasVisibleHistory: Bool?

    /// Optional. For supergroups, name of the group sticker set
    public let stickerSetName: String?

    /// Optional. True, if the bot can change the group sticker set
    public let canSetStickerSet: Bool?

    /// Optional. For supergroups, the name of the group's custom emoji sticker set. Custom emoji from this set can be used by all users and bots in the group.
    public let customEmojiStickerSetName: String?

    /// Optional. Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
    public let linkedChatId: Int64?

    /// Optional. For supergroups, the location to which the supergroup is connected
    public let location: TGChatLocation?

    public init (id: Int, type: TGChatFullInfoType, title: String? = nil, username: String? = nil, firstName: String? = nil, lastName: String? = nil, isForum: Bool? = nil, isDirectMessages: Bool? = nil, accentColorId: Int, maxReactionCount: Int, photo: TGChatPhoto? = nil, activeUsernames: [String]? = nil, birthdate: TGBirthdate? = nil, businessIntro: TGBusinessIntro? = nil, businessLocation: TGBusinessLocation? = nil, businessOpeningHours: TGBusinessOpeningHours? = nil, personalChat: TGChat? = nil, parentChat: TGChat? = nil, availableReactions: [TGReactionType]? = nil, backgroundCustomEmojiId: String? = nil, profileAccentColorId: Int? = nil, profileBackgroundCustomEmojiId: String? = nil, emojiStatusCustomEmojiId: String? = nil, emojiStatusExpirationDate: Int? = nil, bio: String? = nil, hasPrivateForwards: Bool? = nil, hasRestrictedVoiceAndVideoMessages: Bool? = nil, joinToSendMessages: Bool? = nil, joinByRequest: Bool? = nil, description: String? = nil, inviteLink: String? = nil, pinnedMessage: TGMessage? = nil, permissions: TGChatPermissions? = nil, acceptedGiftTypes: TGAcceptedGiftTypes, canSendPaidMedia: Bool? = nil, slowModeDelay: Int? = nil, unrestrictBoostCount: Int? = nil, messageAutoDeleteTime: Int? = nil, hasAggressiveAntiSpamEnabled: Bool? = nil, hasHiddenMembers: Bool? = nil, hasProtectedContent: Bool? = nil, hasVisibleHistory: Bool? = nil, stickerSetName: String? = nil, canSetStickerSet: Bool? = nil, customEmojiStickerSetName: String? = nil, linkedChatId: Int64? = nil, location: TGChatLocation? = nil) {
        self.id = id
        self.type = type
        self.title = title
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.isForum = isForum
        self.isDirectMessages = isDirectMessages
        self.accentColorId = accentColorId
        self.maxReactionCount = maxReactionCount
        self.photo = photo
        self.activeUsernames = activeUsernames
        self.birthdate = birthdate
        self.businessIntro = businessIntro
        self.businessLocation = businessLocation
        self.businessOpeningHours = businessOpeningHours
        self.personalChat = personalChat
        self.parentChat = parentChat
        self.availableReactions = availableReactions
        self.backgroundCustomEmojiId = backgroundCustomEmojiId
        self.profileAccentColorId = profileAccentColorId
        self.profileBackgroundCustomEmojiId = profileBackgroundCustomEmojiId
        self.emojiStatusCustomEmojiId = emojiStatusCustomEmojiId
        self.emojiStatusExpirationDate = emojiStatusExpirationDate
        self.bio = bio
        self.hasPrivateForwards = hasPrivateForwards
        self.hasRestrictedVoiceAndVideoMessages = hasRestrictedVoiceAndVideoMessages
        self.joinToSendMessages = joinToSendMessages
        self.joinByRequest = joinByRequest
        self.description = description
        self.inviteLink = inviteLink
        self.pinnedMessage = pinnedMessage
        self.permissions = permissions
        self.acceptedGiftTypes = acceptedGiftTypes
        self.canSendPaidMedia = canSendPaidMedia
        self.slowModeDelay = slowModeDelay
        self.unrestrictBoostCount = unrestrictBoostCount
        self.messageAutoDeleteTime = messageAutoDeleteTime
        self.hasAggressiveAntiSpamEnabled = hasAggressiveAntiSpamEnabled
        self.hasHiddenMembers = hasHiddenMembers
        self.hasProtectedContent = hasProtectedContent
        self.hasVisibleHistory = hasVisibleHistory
        self.stickerSetName = stickerSetName
        self.canSetStickerSet = canSetStickerSet
        self.customEmojiStickerSetName = customEmojiStickerSetName
        self.linkedChatId = linkedChatId
        self.location = location
    }
}
