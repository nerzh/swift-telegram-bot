// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents changes in the status of a chat member.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberUpdated](https://core.telegram.org/bots/api#chatmemberupdated)
 **/
public final class TGChatMemberUpdated: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatMemberUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case from = "from"
        case date = "date"
        case oldChatMember = "old_chat_member"
        case newChatMember = "new_chat_member"
        case inviteLink = "invite_link"
        case viaJoinRequest = "via_join_request"
        case viaChatFolderInviteLink = "via_chat_folder_invite_link"
    }

    /// Chat the user belongs to
    public let chat: TGChat

    /// Performer of the action, which resulted in the change
    public let from: TGUser

    /// Date the change was done in Unix time
    public let date: Int

    /// Previous information about the chat member
    public let oldChatMember: TGChatMember

    /// New information about the chat member
    public let newChatMember: TGChatMember

    /// Optional. Chat invite link, which was used by the user to join the chat; for joining by invite link events only.
    public let inviteLink: TGChatInviteLink?

    /// Optional. True, if the user joined the chat after sending a direct join request without using an invite link and being approved by an administrator
    public let viaJoinRequest: Bool?

    /// Optional. True, if the user joined the chat via a chat folder invite link
    public let viaChatFolderInviteLink: Bool?

    public init (chat: TGChat, from: TGUser, date: Int, oldChatMember: TGChatMember, newChatMember: TGChatMember, inviteLink: TGChatInviteLink? = nil, viaJoinRequest: Bool? = nil, viaChatFolderInviteLink: Bool? = nil) {
        self.chat = chat
        self.from = from
        self.date = date
        self.oldChatMember = oldChatMember
        self.newChatMember = newChatMember
        self.inviteLink = inviteLink
        self.viaJoinRequest = viaJoinRequest
        self.viaChatFolderInviteLink = viaChatFolderInviteLink
    }
}
