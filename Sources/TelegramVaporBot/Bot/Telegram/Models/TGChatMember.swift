// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains information about one member of a chat. Currently, the following 6 types of chat members are supported:
 ChatMemberOwner
 ChatMemberAdministrator
 ChatMemberMember
 ChatMemberRestricted
 ChatMemberLeft
 ChatMemberBanned

 SeeAlso Telegram Bot API Reference:
 [ChatMember](https://core.telegram.org/bots/api#chatmember)
 */
public final class TGChatMember: Codable {

    /// Custom keys for coding/decoding `ChatMember` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case isAnonymous = "is_anonymous"
        case customTitle = "custom_title"
        case canBeEdited = "can_be_edited"
        case canManageChat = "can_manage_chat"
        case canDeleteMessages = "can_delete_messages"
        case canManageVideoChats = "can_manage_video_chats"
        case canRestrictMembers = "can_restrict_members"
        case canPromoteMembers = "can_promote_members"
        case canChangeInfo = "can_change_info"
        case canInviteUsers = "can_invite_users"
        case canPostMessages = "can_post_messages"
        case canEditMessages = "can_edit_messages"
        case canPinMessages = "can_pin_messages"
        case canManageTopics = "can_manage_topics"
        case isMember = "is_member"
        case canSendMessages = "can_send_messages"
        case canSendMediaMessages = "can_send_media_messages"
        case canSendPolls = "can_send_polls"
        case canSendOtherMessages = "can_send_other_messages"
        case canAddWebPagePreviews = "can_add_web_page_previews"
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “creator”
    public var status: String

    /// Information about the user
    public var user: TGUser

    /// True, if the user's presence in the chat is hidden
    public var isAnonymous: Bool?

    /// Optional. Custom title for this user
    public var customTitle: String?

    /// The member's status in the chat, always “administrator”
    /// True, if the bot is allowed to edit administrator privileges of that user
    public var canBeEdited: Bool?

    /// True, if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other administrator privilege
    public var canManageChat: Bool?

    /// True, if the administrator can delete messages of other users
    public var canDeleteMessages: Bool?

    /// True, if the administrator can manage video chats
    public var canManageVideoChats: Bool?

    /// True, if the administrator can restrict, ban or unban chat members
    public var canRestrictMembers: Bool?

    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    public var canPromoteMembers: Bool?

    /// True, if the user is allowed to change the chat title, photo and other settings
    public var canChangeInfo: Bool?

    /// True, if the user is allowed to invite new users to the chat
    public var canInviteUsers: Bool?

    /// Optional. True, if the administrator can post in the channel; channels only
    public var canPostMessages: Bool?

    /// Optional. True, if the administrator can edit messages of other users and can pin messages; channels only
    public var canEditMessages: Bool?

    /// Optional. True, if the user is allowed to pin messages; groups and supergroups only
    public var canPinMessages: Bool?

    /// Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
    public var canManageTopics: Bool?

    /// The member's status in the chat, always “member”
    /// The member's status in the chat, always “restricted”
    /// True, if the user is a member of the chat at the moment of the request
    public var isMember: Bool?

    /// True, if the user is allowed to pin messages
    /// True, if the user is allowed to create forum topics
    /// True, if the user is allowed to send text messages, contacts, locations and venues
    public var canSendMessages: Bool?

    /// True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes
    public var canSendMediaMessages: Bool?

    /// True, if the user is allowed to send polls
    public var canSendPolls: Bool?

    /// True, if the user is allowed to send animations, games, stickers and use inline bots
    public var canSendOtherMessages: Bool?

    /// True, if the user is allowed to add web page previews to their messages
    public var canAddWebPagePreviews: Bool?

    /// Date when restrictions will be lifted for this user; unix time. If 0, then the user is restricted forever
    public var untilDate: Int?

    /// The member's status in the chat, always “left”
    /// The member's status in the chat, always “kicked”
    /// Date when restrictions will be lifted for this user; unix time. If 0, then the user is banned forever
    public init (status: String, user: TGUser, isAnonymous: Bool?, customTitle: String?, canBeEdited: Bool?, canManageChat: Bool?, canDeleteMessages: Bool?, canManageVideoChats: Bool?, canRestrictMembers: Bool?, canPromoteMembers: Bool?, canChangeInfo: Bool?, canInviteUsers: Bool?, canPostMessages: Bool?, canEditMessages: Bool?, canPinMessages: Bool?, canManageTopics: Bool?, isMember: Bool?, canSendMessages: Bool?, canSendMediaMessages: Bool?, canSendPolls: Bool?, canSendOtherMessages: Bool?, canAddWebPagePreviews: Bool?, untilDate: Int?) {
        self.status = status
        self.user = user
        self.isAnonymous = isAnonymous
        self.customTitle = customTitle
        self.canBeEdited = canBeEdited
        self.canManageChat = canManageChat
        self.canDeleteMessages = canDeleteMessages
        self.canManageVideoChats = canManageVideoChats
        self.canRestrictMembers = canRestrictMembers
        self.canPromoteMembers = canPromoteMembers
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPostMessages = canPostMessages
        self.canEditMessages = canEditMessages
        self.canPinMessages = canPinMessages
        self.canManageTopics = canManageTopics
        self.isMember = isMember
        self.canSendMessages = canSendMessages
        self.canSendMediaMessages = canSendMediaMessages
        self.canSendPolls = canSendPolls
        self.canSendOtherMessages = canSendOtherMessages
        self.canAddWebPagePreviews = canAddWebPagePreviews
        self.untilDate = untilDate
    }
}
