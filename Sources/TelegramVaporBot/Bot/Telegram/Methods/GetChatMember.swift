// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get information about a member of a chat. Returns a ChatMember object on success.


/// Parameters container struct for `getChatMember` method
public struct TGGetChatMemberParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// Custom keys for coding/decoding `GetChatMemberParams` struct
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
 Use this method to get information about a member of a chat. Returns a ChatMember object on success.

 SeeAlso Telegram Bot API Reference:
 [GetChatMemberParams](https://core.telegram.org/bots/api#getchatmember)
 
 - Parameters:
     - params: Parameters container, see `GetChatMemberParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGChatMember` type
 */
    @discardableResult
    func getChatMember(params: TGGetChatMemberParams) throws -> EventLoopFuture<TGChatMember> {
        let methodURL: URI = .init(string: getMethodURL("getChatMember"))
        let future: EventLoopFuture<TGChatMember> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
