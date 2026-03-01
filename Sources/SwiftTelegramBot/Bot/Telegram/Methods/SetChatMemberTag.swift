// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set a tag for a regular member in a group or a supergroup. The bot must be an administrator in the chat for this to work and must have the can_manage_tags administrator right. Returns True on success.


/// Parameters container struct for `setChatMemberTag` method
public struct TGSetChatMemberTagParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public let chatId: TGChatId

    /// Unique identifier of the target user
    public let userId: Int64

    /// New tag for the member; 0-16 characters, emoji are not allowed
    public let tag: String?

    /// Custom keys for coding/decoding `SetChatMemberTagParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case tag = "tag"
    }

    public init(chatId: TGChatId, userId: Int64, tag: String? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.tag = tag
    }
}


public extension TGBot {

/**
 Use this method to set a tag for a regular member in a group or a supergroup. The bot must be an administrator in the chat for this to work and must have the can_manage_tags administrator right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatMemberTagParams](https://core.telegram.org/bots/api#setchatmembertag)
 
 - Parameters:
     - params: Parameters container, see `SetChatMemberTagParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatMemberTag(params: TGSetChatMemberTagParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatMemberTag")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatMemberTag"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
