// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete multiple messages simultaneously. If some of the specified messages can't be found, they are skipped. Returns True on success.


/// Parameters container struct for `deleteMessages` method
public struct TGDeleteMessagesParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// A JSON-serialized list of 1-100 identifiers of messages to delete. See deleteMessage for limitations on which messages can be deleted
    public let messageIds: [Int]

    /// Custom keys for coding/decoding `DeleteMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageIds = "message_ids"
    }

    public init(chatId: TGChatId, messageIds: [Int]) {
            self.chatId = chatId
            self.messageIds = messageIds
    }
}


public extension TGBot {

/**
 Use this method to delete multiple messages simultaneously. If some of the specified messages can't be found, they are skipped. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteMessagesParams](https://core.telegram.org/bots/api#deletemessages)
 
 - Parameters:
     - params: Parameters container, see `DeleteMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteMessages(params: TGDeleteMessagesParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteMessages")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteMessages"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
