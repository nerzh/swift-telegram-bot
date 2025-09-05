// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to decline a suggested post in a direct messages chat. The bot must have the 'can_manage_direct_messages' administrator right in the corresponding channel chat. Returns True on success.


/// Parameters container struct for `declineSuggestedPost` method
public struct TGDeclineSuggestedPostParams: Encodable, Sendable {

    /// Unique identifier for the target direct messages chat
    public let chatId: Int64

    /// Identifier of a suggested post message to decline
    public let messageId: Int

    /// Comment for the creator of the suggested post; 0-128 characters
    public let comment: String?

    /// Custom keys for coding/decoding `DeclineSuggestedPostParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case comment = "comment"
    }

    public init(chatId: Int64, messageId: Int, comment: String? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.comment = comment
    }
}


public extension TGBot {

/**
 Use this method to decline a suggested post in a direct messages chat. The bot must have the 'can_manage_direct_messages' administrator right in the corresponding channel chat. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeclineSuggestedPostParams](https://core.telegram.org/bots/api#declinesuggestedpost)
 
 - Parameters:
     - params: Parameters container, see `DeclineSuggestedPostParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func declineSuggestedPost(params: TGDeclineSuggestedPostParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("declineSuggestedPost")) else {
            throw BotError("Bad URL: \(getMethodURL("declineSuggestedPost"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
