// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get a list of administrators in a chat. Returns an Array of ChatMember objects.


/// Parameters container struct for `getChatAdministrators` method
public struct TGGetChatAdministratorsParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup or channel in the format @username
    public let chatId: TGChatId

    /// Pass True to additionally receive all bots that are administrators of the chat. By default, bots other than the current bot are omitted.
    public let returnBots: Bool?

    /// Custom keys for coding/decoding `GetChatAdministratorsParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case returnBots = "return_bots"
    }

    public init(chatId: TGChatId, returnBots: Bool? = nil) {
            self.chatId = chatId
            self.returnBots = returnBots
    }
}


public extension TGBot {

/**
 Use this method to get a list of administrators in a chat. Returns an Array of ChatMember objects.

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
