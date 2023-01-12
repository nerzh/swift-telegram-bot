// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to decline a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.


/// Parameters container struct for `declineChatJoinRequest` method
public struct TGDeclineChatJoinRequestParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// Custom keys for coding/decoding `DeclineChatJoinRequestParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
    }

    public init(chatId: TGChatId, userId: Int64) {
            self.chatId = chatId
            self.userId = userId
    }
}


public extension TGBot {

/**
 Use this method to decline a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeclineChatJoinRequestParams](https://core.telegram.org/bots/api#declinechatjoinrequest)
 
 - Parameters:
     - params: Parameters container, see `DeclineChatJoinRequestParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func declineChatJoinRequest(params: TGDeclineChatJoinRequestParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("declineChatJoinRequest"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
