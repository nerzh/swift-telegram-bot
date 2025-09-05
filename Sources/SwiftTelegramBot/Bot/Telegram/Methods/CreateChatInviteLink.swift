// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object.


/// Parameters container struct for `createChatInviteLink` method
public struct TGCreateChatInviteLinkParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Invite link name; 0-32 characters
    public let name: String?

    /// Point in time (Unix timestamp) when the link will expire
    public let expireDate: Int?

    /// The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    public let memberLimit: Int?

    /// True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified
    public let createsJoinRequest: Bool?

    /// Custom keys for coding/decoding `CreateChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case name = "name"
            case expireDate = "expire_date"
            case memberLimit = "member_limit"
            case createsJoinRequest = "creates_join_request"
    }

    public init(chatId: TGChatId, name: String? = nil, expireDate: Int? = nil, memberLimit: Int? = nil, createsJoinRequest: Bool? = nil) {
            self.chatId = chatId
            self.name = name
            self.expireDate = expireDate
            self.memberLimit = memberLimit
            self.createsJoinRequest = createsJoinRequest
    }
}


public extension TGBot {

/**
 Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object.

 SeeAlso Telegram Bot API Reference:
 [CreateChatInviteLinkParams](https://core.telegram.org/bots/api#createchatinvitelink)
 
 - Parameters:
     - params: Parameters container, see `CreateChatInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: `TGChatInviteLink`
 */

    @discardableResult
    func createChatInviteLink(params: TGCreateChatInviteLinkParams) async throws -> TGChatInviteLink {
        guard let methodURL: URL = .init(string: getMethodURL("createChatInviteLink")) else {
            throw BotError("Bad URL: \(getMethodURL("createChatInviteLink"))")
        }
        let result: TGChatInviteLink = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
