// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that has some additional privileges.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberAdministrator](https://core.telegram.org/bots/api#chatmemberadministrator)
 **/
public final class TGChatMemberAdministrator: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatMemberAdministrator` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
        case canBeEdited = "can_be_edited"
        case isAnonymous = "is_anonymous"
        case canManageChat = "can_manage_chat"
        case canDeleteMessages = "can_delete_messages"
        case canManageVideoChats = "can_manage_video_chats"
        case canRestrictMembers = "can_restrict_members"
        case canPromoteMembers = "can_promote_members"
        case canChangeInfo = "can_change_info"
        case canInviteUsers = "can_invite_users"
        case canPostStories = "can_post_stories"
        case canEditStories = "can_edit_stories"
        case canDeleteStories = "can_delete_stories"
        case canPostMessages = "can_post_messages"
        case canEditMessages = "can_edit_messages"
        case canPinMessages = "can_pin_messages"
        case canManageTopics = "can_manage_topics"
        case canManageDirectMessages = "can_manage_direct_messages"
        case canManageTags = "can_manage_tags"
        case customTitle = "custom_title"
    }

    /// The member's status in the chat, always “administrator”
    public let status: String

    /// Information about the user
    public let user: TGUser

    /// True, if the bot is allowed to edit administrator privileges of that user
    public let canBeEdited: Bool

    /// True, if the user's presence in the chat is hidden
    public let isAnonymous: Bool

    /// True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    public let canManageChat: Bool

    /// True, if the administrator can delete messages of other users
    public let canDeleteMessages: Bool

    /// True, if the administrator can manage video chats
    public let canManageVideoChats: Bool

    /// True, if the administrator can restrict, ban or unban chat members, or access supergroup statistics
    public let canRestrictMembers: Bool

    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    public let canPromoteMembers: Bool

    /// True, if the user is allowed to change the chat title, photo and other settings
    public let canChangeInfo: Bool

    /// True, if the user is allowed to invite new users to the chat
    public let canInviteUsers: Bool

    /// True, if the administrator can post stories to the chat
    public let canPostStories: Bool

    /// True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat's story archive
    public let canEditStories: Bool

    /// True, if the administrator can delete stories posted by other users
    public let canDeleteStories: Bool

    /// Optional. True, if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    public let canPostMessages: Bool?

    /// Optional. True, if the administrator can edit messages of other users and can pin messages; for channels only
    public let canEditMessages: Bool?

    /// Optional. True, if the user is allowed to pin messages; for groups and supergroups only
    public let canPinMessages: Bool?

    /// Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    public let canManageTopics: Bool?

    /// Optional. True, if the administrator can manage direct messages of the channel and decline suggested posts; for channels only
    public let canManageDirectMessages: Bool?

    /// Optional. True, if the administrator can edit the tags of regular members; for groups and supergroups only. If omitted defaults to the value of can_pin_messages.
    public let canManageTags: Bool?

    /// Optional. Custom title for this user
    public let customTitle: String?

    public init (status: String, user: TGUser, canBeEdited: Bool, isAnonymous: Bool, canManageChat: Bool, canDeleteMessages: Bool, canManageVideoChats: Bool, canRestrictMembers: Bool, canPromoteMembers: Bool, canChangeInfo: Bool, canInviteUsers: Bool, canPostStories: Bool, canEditStories: Bool, canDeleteStories: Bool, canPostMessages: Bool? = nil, canEditMessages: Bool? = nil, canPinMessages: Bool? = nil, canManageTopics: Bool? = nil, canManageDirectMessages: Bool? = nil, canManageTags: Bool? = nil, customTitle: String? = nil) {
        self.status = status
        self.user = user
        self.canBeEdited = canBeEdited
        self.isAnonymous = isAnonymous
        self.canManageChat = canManageChat
        self.canDeleteMessages = canDeleteMessages
        self.canManageVideoChats = canManageVideoChats
        self.canRestrictMembers = canRestrictMembers
        self.canPromoteMembers = canPromoteMembers
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPostStories = canPostStories
        self.canEditStories = canEditStories
        self.canDeleteStories = canDeleteStories
        self.canPostMessages = canPostMessages
        self.canEditMessages = canEditMessages
        self.canPinMessages = canPinMessages
        self.canManageTopics = canManageTopics
        self.canManageDirectMessages = canManageDirectMessages
        self.canManageTags = canManageTags
        self.customTitle = customTitle
    }
}
