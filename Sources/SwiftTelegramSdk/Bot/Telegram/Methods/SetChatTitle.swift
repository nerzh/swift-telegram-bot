// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `setChatTitle` method
public struct TGSetChatTitleParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// New chat title, 1-128 characters
    public let title: String

    /// Custom keys for coding/decoding `SetChatTitleParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case title = "title"
    }

    public init(chatId: TGChatId, title: String) {
            self.chatId = chatId
            self.title = title
    }
}


public extension TGBot {

/**
 Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatTitleParams](https://core.telegram.org/bots/api#setchattitle)
 
 - Parameters:
     - params: Parameters container, see `SetChatTitleParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatTitle(params: TGSetChatTitleParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatTitle")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatTitle"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
