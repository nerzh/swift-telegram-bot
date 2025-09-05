// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to approve a suggested post in a direct messages chat. The bot must have the 'can_post_messages' administrator right in the corresponding channel chat. Returns True on success.


/// Parameters container struct for `approveSuggestedPost` method
public struct TGApproveSuggestedPostParams: Encodable, Sendable {

    /// Unique identifier for the target direct messages chat
    public let chatId: Int64

    /// Identifier of a suggested post message to approve
    public let messageId: Int

    /// Point in time (Unix timestamp) when the post is expected to be published; omit if the date has already been specified when the suggested post was created. If specified, then the date must be not more than 2678400 seconds (30 days) in the future
    public let sendDate: Int?

    /// Custom keys for coding/decoding `ApproveSuggestedPostParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case sendDate = "send_date"
    }

    public init(chatId: Int64, messageId: Int, sendDate: Int? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.sendDate = sendDate
    }
}


public extension TGBot {

/**
 Use this method to approve a suggested post in a direct messages chat. The bot must have the 'can_post_messages' administrator right in the corresponding channel chat. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [ApproveSuggestedPostParams](https://core.telegram.org/bots/api#approvesuggestedpost)
 
 - Parameters:
     - params: Parameters container, see `ApproveSuggestedPostParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func approveSuggestedPost(params: TGApproveSuggestedPostParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("approveSuggestedPost")) else {
            throw BotError("Bad URL: \(getMethodURL("approveSuggestedPost"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
