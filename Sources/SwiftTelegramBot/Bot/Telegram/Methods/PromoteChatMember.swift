// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success.


/// Parameters container struct for `promoteChatMember` method
public struct TGPromoteChatMemberParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier of the target user
    public let userId: Int64

    /// Pass True if the administrator's presence in the chat is hidden
    public let isAnonymous: Bool?

    /// Pass True if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report spam messages, ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other administrator privilege.
    public let canManageChat: Bool?

    /// Pass True if the administrator can delete messages of other users
    public let canDeleteMessages: Bool?

    /// Pass True if the administrator can manage video chats
    public let canManageVideoChats: Bool?

    /// Pass True if the administrator can restrict, ban or unban chat members, or access supergroup statistics. For backward compatibility, defaults to True for promotions of channel administrators
    public let canRestrictMembers: Bool?

    /// Pass True if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by him)
    public let canPromoteMembers: Bool?

    /// Pass True if the administrator can change chat title, photo and other settings
    public let canChangeInfo: Bool?

    /// Pass True if the administrator can invite new users to the chat
    public let canInviteUsers: Bool?

    /// Pass True if the administrator can post stories to the chat
    public let canPostStories: Bool?

    /// Pass True if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access the chat's story archive
    public let canEditStories: Bool?

    /// Pass True if the administrator can delete stories posted by other users
    public let canDeleteStories: Bool?

    /// Pass True if the administrator can post messages in the channel, approve suggested posts, or access channel statistics; for channels only
    public let canPostMessages: Bool?

    /// Pass True if the administrator can edit messages of other users and can pin messages; for channels only
    public let canEditMessages: Bool?

    /// Pass True if the administrator can pin messages; for supergroups only
    public let canPinMessages: Bool?

    /// Pass True if the user is allowed to create, rename, close, and reopen forum topics; for supergroups only
    public let canManageTopics: Bool?

    /// Pass True if the administrator can manage direct messages within the channel and decline suggested posts; for channels only
    public let canManageDirectMessages: Bool?

    /// Pass True if the administrator can edit the tags of regular members; for groups and supergroups only
    public let canManageTags: Bool?

    /// Custom keys for coding/decoding `PromoteChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
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
    }

    public init(chatId: TGChatId, userId: Int64, isAnonymous: Bool? = nil, canManageChat: Bool? = nil, canDeleteMessages: Bool? = nil, canManageVideoChats: Bool? = nil, canRestrictMembers: Bool? = nil, canPromoteMembers: Bool? = nil, canChangeInfo: Bool? = nil, canInviteUsers: Bool? = nil, canPostStories: Bool? = nil, canEditStories: Bool? = nil, canDeleteStories: Bool? = nil, canPostMessages: Bool? = nil, canEditMessages: Bool? = nil, canPinMessages: Bool? = nil, canManageTopics: Bool? = nil, canManageDirectMessages: Bool? = nil, canManageTags: Bool? = nil) {
            self.chatId = chatId
            self.userId = userId
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
    }
}


public extension TGBot {

/**
 Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [PromoteChatMemberParams](https://core.telegram.org/bots/api#promotechatmember)
 
 - Parameters:
     - params: Parameters container, see `PromoteChatMemberParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func promoteChatMember(params: TGPromoteChatMemberParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("promoteChatMember")) else {
            throw BotError("Bad URL: \(getMethodURL("promoteChatMember"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
