// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes actions that a non-administrator user is allowed to take in a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatPermissions](https://core.telegram.org/bots/api#chatpermissions)
 **/
public final class TGChatPermissions: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatPermissions` struct
    public enum CodingKeys: String, CodingKey {
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
    }

    /// Optional. True, if the user is allowed to send text messages, contacts, giveaways, giveaway winners, invoices, locations and venues
    public let canSendMessages: Bool?

    /// Optional. True, if the user is allowed to send audios
    public let canSendAudios: Bool?

    /// Optional. True, if the user is allowed to send documents
    public let canSendDocuments: Bool?

    /// Optional. True, if the user is allowed to send photos
    public let canSendPhotos: Bool?

    /// Optional. True, if the user is allowed to send videos
    public let canSendVideos: Bool?

    /// Optional. True, if the user is allowed to send video notes
    public let canSendVideoNotes: Bool?

    /// Optional. True, if the user is allowed to send voice notes
    public let canSendVoiceNotes: Bool?

    /// Optional. True, if the user is allowed to send polls and checklists
    public let canSendPolls: Bool?

    /// Optional. True, if the user is allowed to send animations, games, stickers and use inline bots
    public let canSendOtherMessages: Bool?

    /// Optional. True, if the user is allowed to add web page previews to their messages
    public let canAddWebPagePreviews: Bool?

    /// Optional. True, if the user is allowed to edit their own tag
    public let canEditTag: Bool?

    /// Optional. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
    public let canChangeInfo: Bool?

    /// Optional. True, if the user is allowed to invite new users to the chat
    public let canInviteUsers: Bool?

    /// Optional. True, if the user is allowed to pin messages. Ignored in public supergroups
    public let canPinMessages: Bool?

    /// Optional. True, if the user is allowed to create forum topics. If omitted defaults to the value of can_pin_messages
    public let canManageTopics: Bool?

    public init (canSendMessages: Bool? = nil, canSendAudios: Bool? = nil, canSendDocuments: Bool? = nil, canSendPhotos: Bool? = nil, canSendVideos: Bool? = nil, canSendVideoNotes: Bool? = nil, canSendVoiceNotes: Bool? = nil, canSendPolls: Bool? = nil, canSendOtherMessages: Bool? = nil, canAddWebPagePreviews: Bool? = nil, canEditTag: Bool? = nil, canChangeInfo: Bool? = nil, canInviteUsers: Bool? = nil, canPinMessages: Bool? = nil, canManageTopics: Bool? = nil) {
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
    }
}
