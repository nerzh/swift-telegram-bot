// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an invite link for a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatInviteLink](https://core.telegram.org/bots/api#chatinvitelink)
 **/
public final class TGChatInviteLink: Codable, Sendable {

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
        case subscriptionPeriod = "subscription_period"
        case subscriptionPrice = "subscription_price"
    }

    /// The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with “…”.
    public let inviteLink: String

    /// Creator of the link
    public let creator: TGUser

    /// True, if users joining the chat via the link need to be approved by chat administrators
    public let createsJoinRequest: Bool

    /// True, if the link is primary
    public let isPrimary: Bool

    /// True, if the link is revoked
    public let isRevoked: Bool

    /// Optional. Invite link name
    public let name: String?

    /// Optional. Point in time (Unix timestamp) when the link will expire or has been expired
    public let expireDate: Int?

    /// Optional. The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    public let memberLimit: Int?

    /// Optional. Number of pending join requests created using this link
    public let pendingJoinRequestCount: Int?

    /// Optional. The number of seconds the subscription will be active for before the next payment
    public let subscriptionPeriod: Int?

    /// Optional. The amount of Telegram Stars a user must pay initially and after each subsequent subscription period to be a member of the chat using the link
    public let subscriptionPrice: Int?

    public init (inviteLink: String, creator: TGUser, createsJoinRequest: Bool, isPrimary: Bool, isRevoked: Bool, name: String? = nil, expireDate: Int? = nil, memberLimit: Int? = nil, pendingJoinRequestCount: Int? = nil, subscriptionPeriod: Int? = nil, subscriptionPrice: Int? = nil) {
        self.inviteLink = inviteLink
        self.creator = creator
        self.createsJoinRequest = createsJoinRequest
        self.isPrimary = isPrimary
        self.isRevoked = isRevoked
        self.name = name
        self.expireDate = expireDate
        self.memberLimit = memberLimit
        self.pendingJoinRequestCount = pendingJoinRequestCount
        self.subscriptionPeriod = subscriptionPeriod
        self.subscriptionPrice = subscriptionPrice
    }
}
