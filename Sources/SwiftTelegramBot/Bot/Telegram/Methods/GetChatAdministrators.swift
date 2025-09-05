// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.


/// Parameters container struct for `getChatAdministrators` method
public struct TGGetChatAdministratorsParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Custom keys for coding/decoding `GetChatAdministratorsParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.

 SeeAlso Telegram Bot API Reference:
 [GetChatAdministratorsParams](https://core.telegram.org/bots/api#getchatadministrators)
 
 - Parameters:
     - params: Parameters container, see `GetChatAdministratorsParams` struct
 - Throws: Throws on errors
 - Returns: `[TGChatMember]`
 */

    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) async throws -> [TGChatMember] {
        guard let methodURL: URL = .init(string: getMethodURL("getChatAdministrators")) else {
            throw BotError("Bad URL: \(getMethodURL("getChatAdministrators"))")
        }
        let result: [TGChatMember] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
