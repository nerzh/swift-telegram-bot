// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete an ephemeral message. Note that it is not guaranteed that the user will receive the message deletion event, especially if they are offline. Returns True on success.


/// Parameters container struct for `deleteEphemeralMessage` method
public struct TGDeleteEphemeralMessageParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Identifier of the user who received the message
    public let receiverUserId: Int64

    /// Identifier of the ephemeral message to delete
    public let ephemeralMessageId: Int

    /// Custom keys for coding/decoding `DeleteEphemeralMessageParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case receiverUserId = "receiver_user_id"
            case ephemeralMessageId = "ephemeral_message_id"
    }

    public init(chatId: TGChatId, receiverUserId: Int64, ephemeralMessageId: Int) {
            self.chatId = chatId
            self.receiverUserId = receiverUserId
            self.ephemeralMessageId = ephemeralMessageId
    }
}


public extension TGBot {

/**
 Use this method to delete an ephemeral message. Note that it is not guaranteed that the user will receive the message deletion event, especially if they are offline. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteEphemeralMessageParams](https://core.telegram.org/bots/api#deleteephemeralmessage)
 
 - Parameters:
     - params: Parameters container, see `DeleteEphemeralMessageParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteEphemeralMessage(params: TGDeleteEphemeralMessageParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteEphemeralMessage")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteEphemeralMessage"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
