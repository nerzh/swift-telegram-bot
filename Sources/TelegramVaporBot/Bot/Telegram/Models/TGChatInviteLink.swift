// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an invite link for a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatInviteLink](https://core.telegram.org/bots/api#chatinvitelink)
 */
public final class TGChatInviteLink: Codable {

    /// Custom keys for coding/decoding `ChatInviteLink` struct
    public enum CodingKeys: String, CodingKey {
        case inviteLink = "invite_link"
        case creator = "creator"
        case createsJoinRequest = "creates_join_request"
        case isPrimary = "is_primary"
        case isRevoked = "is_revoked"
        case name = "name"
        case expireDate = "expire_date"
        case memberLimit = "member_limit"
        case pendingJoinRequestCount = "pending_join_request_count"
    }

    /// The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with “…”.
    public var inviteLink: String

    /// Creator of the link
    public var creator: TGUser

    /// True, if users joining the chat via the link need to be approved by chat administrators
    public var createsJoinRequest: Bool

    /// True, if the link is primary
    public var isPrimary: Bool

    /// True, if the link is revoked
    public var isRevoked: Bool

    /// Optional. Invite link name
    public var name: String?

    /// Optional. Point in time (Unix timestamp) when the link will expire or has been expired
    public var expireDate: Int?

    /// Optional. The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    public var memberLimit: Int?

    /// Optional. Number of pending join requests created using this link
    public var pendingJoinRequestCount: Int?

    public init (inviteLink: String, creator: TGUser, createsJoinRequest: Bool, isPrimary: Bool, isRevoked: Bool, name: String? = nil, expireDate: Int? = nil, memberLimit: Int? = nil, pendingJoinRequestCount: Int? = nil) {
        self.inviteLink = inviteLink
        self.creator = creator
        self.createsJoinRequest = createsJoinRequest
        self.isPrimary = isPrimary
        self.isRevoked = isRevoked
        self.name = name
        self.expireDate = expireDate
        self.memberLimit = memberLimit
        self.pendingJoinRequestCount = pendingJoinRequestCount
    }
}
