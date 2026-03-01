// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that is under certain restrictions in the chat. Supergroups only.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberRestricted](https://core.telegram.org/bots/api#chatmemberrestricted)
 **/
public final class TGChatMemberRestricted: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatMemberRestricted` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case tag = "tag"
        case user = "user"
        case isMember = "is_member"
        case canSendMessages = "can_send_messages"
        case canSendAudios = "can_send_audios"
        case canSendDocuments = "can_send_documents"
        case canSendPhotos = "can_send_photos"
        case canSendVideos = "can_send_videos"
        case canSendVideoNotes = "can_send_video_notes"
        case canSendVoiceNotes = "can_send_voice_notes"
        case canSendPolls = "can_send_polls"
        case canSendOtherMessages = "can_send_other_messages"
        case canAddWebPagePreviews = "can_add_web_page_previews"
        case canEditTag = "can_edit_tag"
        case canChangeInfo = "can_change_info"
        case canInviteUsers = "can_invite_users"
        case canPinMessages = "can_pin_messages"
        case canManageTopics = "can_manage_topics"
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “restricted”
    public let status: String

    /// Optional. Tag of the member
    public let tag: String?

    /// Information about the user
    public let user: TGUser

    /// True, if the user is a member of the chat at the moment of the request
    public let isMember: Bool

    /// True, if the user is allowed to send text messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    public let canSendMessages: Bool

    /// True, if the user is allowed to send audios
    public let canSendAudios: Bool

    /// True, if the user is allowed to send documents
    public let canSendDocuments: Bool

    /// True, if the user is allowed to send photos
    public let canSendPhotos: Bool

    /// True, if the user is allowed to send videos
    public let canSendVideos: Bool

    /// True, if the user is allowed to send video notes
    public let canSendVideoNotes: Bool

    /// True, if the user is allowed to send voice notes
    public let canSendVoiceNotes: Bool

    /// True, if the user is allowed to send polls and checklists
    public let canSendPolls: Bool

    /// True, if the user is allowed to send animations, games, stickers and use inline bots
    public let canSendOtherMessages: Bool

    /// True, if the user is allowed to add web page previews to their messages
    public let canAddWebPagePreviews: Bool

    /// True, if the user is allowed to edit their own tag
    public let canEditTag: Bool

    /// True, if the user is allowed to change the chat title, photo and other settings
    public let canChangeInfo: Bool

    /// True, if the user is allowed to invite new users to the chat
    public let canInviteUsers: Bool

    /// True, if the user is allowed to pin messages
    public let canPinMessages: Bool

    /// True, if the user is allowed to create forum topics
    public let canManageTopics: Bool

    /// Date when restrictions will be lifted for this user; Unix time. If 0, then the user is restricted forever
    public let untilDate: Int

    public init (status: String, tag: String? = nil, user: TGUser, isMember: Bool, canSendMessages: Bool, canSendAudios: Bool, canSendDocuments: Bool, canSendPhotos: Bool, canSendVideos: Bool, canSendVideoNotes: Bool, canSendVoiceNotes: Bool, canSendPolls: Bool, canSendOtherMessages: Bool, canAddWebPagePreviews: Bool, canEditTag: Bool, canChangeInfo: Bool, canInviteUsers: Bool, canPinMessages: Bool, canManageTopics: Bool, untilDate: Int) {
        self.status = status
        self.tag = tag
        self.user = user
        self.isMember = isMember
        self.canSendMessages = canSendMessages
        self.canSendAudios = canSendAudios
        self.canSendDocuments = canSendDocuments
        self.canSendPhotos = canSendPhotos
        self.canSendVideos = canSendVideos
        self.canSendVideoNotes = canSendVideoNotes
        self.canSendVoiceNotes = canSendVoiceNotes
        self.canSendPolls = canSendPolls
        self.canSendOtherMessages = canSendOtherMessages
        self.canAddWebPagePreviews = canAddWebPagePreviews
        self.canEditTag = canEditTag
        self.canChangeInfo = canChangeInfo
        self.canInviteUsers = canInviteUsers
        self.canPinMessages = canPinMessages
        self.canManageTopics = canManageTopics
        self.untilDate = untilDate
    }
}
