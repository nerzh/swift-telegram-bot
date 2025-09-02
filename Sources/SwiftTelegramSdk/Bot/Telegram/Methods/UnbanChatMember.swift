// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to unban a previously banned user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it. So if the user is a member of the chat they will also be removed from the chat. If you don't want this, use the parameter only_if_banned. Returns True on success.


/// Parameters container struct for `unbanChatMember` method
public struct TGUnbanChatMemberParams: Encodable, Sendable {

    /// Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier of the target user
    public let userId: Int64

    /// Do nothing if the user is not banned
    public let onlyIfBanned: Bool?

    /// Custom keys for coding/decoding `UnbanChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case onlyIfBanned = "only_if_banned"
    }

    public init(chatId: TGChatId, userId: Int64, onlyIfBanned: Bool? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.onlyIfBanned = onlyIfBanned
    }
}


public extension TGBot {

/**
 Use this method to unban a previously banned user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it. So if the user is a member of the chat they will also be removed from the chat. If you don't want this, use the parameter only_if_banned. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnbanChatMemberParams](https://core.telegram.org/bots/api#unbanchatmember)
 
 - Parameters:
     - params: Parameters container, see `UnbanChatMemberParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func unbanChatMember(params: TGUnbanChatMemberParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("unbanChatMember")) else {
            throw BotError("Bad URL: \(getMethodURL("unbanChatMember"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
