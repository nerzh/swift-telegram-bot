// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Verifies a chat on behalf of the organization which is represented by the bot. Returns True on success.


/// Parameters container struct for `verifyChat` method
public struct TGVerifyChatParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target bot, supergroup, or channel in the format @username. Channel direct messages chats can't be verified.
    public let chatId: TGChatId

    /// Custom description for the verification; 0-70 characters. Must be empty if the organization isn't allowed to provide a custom verification description.
    public let customDescription: String?

    /// Mode for parsing entities in the custom description. See formatting options for more details. Only “text_link” entities are supported.
    public let customDescriptionParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the custom description, which can be specified instead of custom_description_parse_mode. Only “text_link” entities are supported.
    public let customDescriptionEntities: [TGMessageEntity]?

    /// Custom keys for coding/decoding `VerifyChatParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case customDescription = "custom_description"
            case customDescriptionParseMode = "custom_description_parse_mode"
            case customDescriptionEntities = "custom_description_entities"
    }

    public init(chatId: TGChatId, customDescription: String? = nil, customDescriptionParseMode: TGParseMode? = nil, customDescriptionEntities: [TGMessageEntity]? = nil) {
            self.chatId = chatId
            self.customDescription = customDescription
            self.customDescriptionParseMode = customDescriptionParseMode
            self.customDescriptionEntities = customDescriptionEntities
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
