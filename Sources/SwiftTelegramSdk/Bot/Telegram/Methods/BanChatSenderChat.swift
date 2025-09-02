// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to ban a channel chat in a supergroup or a channel. Until the chat is unbanned, the owner of the banned chat won't be able to send messages on behalf of any of their channels. The bot must be an administrator in the supergroup or channel for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `banChatSenderChat` method
public struct TGBanChatSenderChatParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier of the target sender chat
    public let senderChatId: Int64

    /// Custom keys for coding/decoding `BanChatSenderChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case senderChatId = "sender_chat_id"
    }

    public init(chatId: TGChatId, senderChatId: Int64) {
            self.chatId = chatId
            self.senderChatId = senderChatId
    }
}


public extension TGBot {

/**
 Use this method to ban a channel chat in a supergroup or a channel. Until the chat is unbanned, the owner of the banned chat won't be able to send messages on behalf of any of their channels. The bot must be an administrator in the supergroup or channel for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [BanChatSenderChatParams](https://core.telegram.org/bots/api#banchatsenderchat)
 
 - Parameters:
     - params: Parameters container, see `BanChatSenderChatParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func banChatSenderChat(params: TGBanChatSenderChatParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("banChatSenderChat")) else {
            throw BotError("Bad URL: \(getMethodURL("banChatSenderChat"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
