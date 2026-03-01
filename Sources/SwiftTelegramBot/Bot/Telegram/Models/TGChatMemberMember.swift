// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a chat member that has no additional privileges or restrictions.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberMember](https://core.telegram.org/bots/api#chatmembermember)
 **/
public final class TGChatMemberMember: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatMemberMember` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case tag = "tag"
        case user = "user"
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “member”
    public let status: String

    /// Optional. Tag of the member
    public let tag: String?

    /// Information about the user
    public let user: TGUser

    /// Optional. Date when the user's subscription will expire; Unix time
    public let untilDate: Int?

    public init (status: String, tag: String? = nil, user: TGUser, untilDate: Int? = nil) {
        self.status = status
        self.tag = tag
        self.user = user
        self.untilDate = untilDate
    }
}
