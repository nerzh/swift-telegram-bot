// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `setChatDescription` method
public struct TGSetChatDescriptionParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// New chat description, 0-255 characters
    public let description: String?

    /// Custom keys for coding/decoding `SetChatDescriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case description = "description"
    }

    public init(chatId: TGChatId, description: String? = nil) {
            self.chatId = chatId
            self.description = description
    }
}


public extension TGBot {

/**
 Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatDescriptionParams](https://core.telegram.org/bots/api#setchatdescription)
 
 - Parameters:
     - params: Parameters container, see `SetChatDescriptionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatDescription")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatDescription"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
