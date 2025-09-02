// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Verifies a chat on behalf of the organization which is represented by the bot. Returns True on success.


/// Parameters container struct for `verifyChat` method
public struct TGVerifyChatParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername). Channel direct messages chats can't be verified.
    public let chatId: TGChatId

    /// Custom description for the verification; 0-70 characters. Must be empty if the organization isn't allowed to provide a custom verification description.
    public let customDescription: String?

    /// Custom keys for coding/decoding `VerifyChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case customDescription = "custom_description"
    }

    public init(chatId: TGChatId, customDescription: String? = nil) {
            self.chatId = chatId
            self.customDescription = customDescription
    }
}


public extension TGBot {

/**
 Verifies a chat on behalf of the organization which is represented by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [VerifyChatParams](https://core.telegram.org/bots/api#verifychat)
 
 - Parameters:
     - params: Parameters container, see `VerifyChatParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func verifyChat(params: TGVerifyChatParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("verifyChat")) else {
            throw BotError("Bad URL: \(getMethodURL("verifyChat"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
