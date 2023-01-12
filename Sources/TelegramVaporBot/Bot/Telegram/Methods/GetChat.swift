// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.


/// Parameters container struct for `getChat` method
public struct TGGetChatParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Custom keys for coding/decoding `GetChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.

 SeeAlso Telegram Bot API Reference:
 [GetChatParams](https://core.telegram.org/bots/api#getchat)
 
 - Parameters:
     - params: Parameters container, see `GetChatParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGChat` type
 */
    @discardableResult
    func getChat(params: TGGetChatParams) throws -> EventLoopFuture<TGChat> {
        let methodURL: URI = .init(string: getMethodURL("getChat"))
        let future: EventLoopFuture<TGChat> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
