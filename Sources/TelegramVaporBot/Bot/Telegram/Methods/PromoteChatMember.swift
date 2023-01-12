// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success.


/// Parameters container struct for `promoteChatMember` method
public struct TGPromoteChatMemberParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// Pass True if the administrator's presence in the chat is hidden
    public var isAnonymous: Bool?

    /// Pass True if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other administrator privilege
    public var canManageChat: Bool?

    /// Pass True if the administrator can create channel posts, channels only
    public var canPostMessages: Bool?

    /// Pass True if the administrator can edit messages of other users and can pin messages, channels only
    public var canEditMessages: Bool?

    /// Pass True if the administrator can delete messages of other users
    public var canDeleteMessages: Bool?

    /// Pass True if the administrator can manage video chats
    public var canManageVideoChats: Bool?

    /// Pass True if the administrator can restrict, ban or unban chat members
    public var canRestrictMembers: Bool?

    /// Pass True if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by him)
    public var canPromoteMembers: Bool?

    /// Pass True if the administrator can change chat title, photo and other settings
    public var canChangeInfo: Bool?

    /// Pass True if the administrator can invite new users to the chat
    public var canInviteUsers: Bool?

    /// Pass True if the administrator can pin messages, supergroups only
    public var canPinMessages: Bool?

    /// Pass True if the user is allowed to create, rename, close, and reopen forum topics, supergroups only
    public var canManageTopics: Bool?

    /// Custom keys for coding/decoding `PromoteChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case isAnonymous = "is_anonymous"
            case canManageChat = "can_manage_chat"
            case canPostMessages = "can_post_messages"
            case canEditMessages = "can_edit_messages"
            case canDeleteMessages = "can_delete_messages"
            case canManageVideoChats = "can_manage_video_chats"
            case canRestrictMembers = "can_restrict_members"
            case canPromoteMembers = "can_promote_members"
            case canChangeInfo = "can_change_info"
            case canInviteUsers = "can_invite_users"
            case canPinMessages = "can_pin_messages"
            case canManageTopics = "can_manage_topics"
    }

    public init(chatId: TGChatId, userId: Int64, isAnonymous: Bool? = nil, canManageChat: Bool? = nil, canPostMessages: Bool? = nil, canEditMessages: Bool? = nil, canDeleteMessages: Bool? = nil, canManageVideoChats: Bool? = nil, canRestrictMembers: Bool? = nil, canPromoteMembers: Bool? = nil, canChangeInfo: Bool? = nil, canInviteUsers: Bool? = nil, canPinMessages: Bool? = nil, canManageTopics: Bool? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.isAnonymous = isAnonymous
            self.canManageChat = canManageChat
            self.canPostMessages = canPostMessages
            self.canEditMessages = canEditMessages
            self.canDeleteMessages = canDeleteMessages
            self.canManageVideoChats = canManageVideoChats
            self.canRestrictMembers = canRestrictMembers
            self.canPromoteMembers = canPromoteMembers
            self.canChangeInfo = canChangeInfo
            self.canInviteUsers = canInviteUsers
            self.canPinMessages = canPinMessages
            self.canManageTopics = canManageTopics
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
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func promoteChatMember(params: TGPromoteChatMemberParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("promoteChatMember"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
