// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.


/// Parameters container struct for `editChatInviteLink` method
public struct TGEditChatInviteLinkParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// The invite link to edit
    public let inviteLink: String

    /// Invite link name; 0-32 characters
    public let name: String?

    /// Point in time (Unix timestamp) when the link will expire
    public let expireDate: Int?

    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    public let memberLimit: Int?

    /// True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified
    public let createsJoinRequest: Bool?

    /// Custom keys for coding/decoding `EditChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case inviteLink = "invite_link"
            case name = "name"
            case expireDate = "expire_date"
            case memberLimit = "member_limit"
            case createsJoinRequest = "creates_join_request"
    }

    public init(chatId: TGChatId, inviteLink: String, name: String? = nil, expireDate: Int? = nil, memberLimit: Int? = nil, createsJoinRequest: Bool? = nil) {
            self.chatId = chatId
            self.inviteLink = inviteLink
            self.name = name
            self.expireDate = expireDate
            self.memberLimit = memberLimit
            self.createsJoinRequest = createsJoinRequest
    }
}


public extension TGBot {

/**
 Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [EditChatInviteLinkParams](https://core.telegram.org/bots/api#editchatinvitelink)
 
 - Parameters:
     - params: Parameters container, see `EditChatInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editChatInviteLink(params: TGEditChatInviteLinkParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editChatInviteLink")) else {
            throw BotError("Bad URL: \(getMethodURL("editChatInviteLink"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
