// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the last messages from the personal chat (i.e., the chat currently added to their profile) of a given user. On success, an array of Message objects is returned.


/// Parameters container struct for `getUserPersonalChatMessages` method
public struct TGGetUserPersonalChatMessagesParams: Encodable, Sendable {

    /// Unique identifier for the target user
    public let userId: Int64

    /// The maximum number of messages to return; 1-20
    public let limit: Int

    /// Custom keys for coding/decoding `GetUserPersonalChatMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case limit = "limit"
    }

    public init(userId: Int64, limit: Int) {
            self.userId = userId
            self.limit = limit
    }
}


public extension TGBot {

/**
 Use this method to get the last messages from the personal chat (i.e., the chat currently added to their profile) of a given user. On success, an array of Message objects is returned.

 SeeAlso Telegram Bot API Reference:
 [GetUserPersonalChatMessagesParams](https://core.telegram.org/bots/api#getuserpersonalchatmessages)
 
 - Parameters:
     - params: Parameters container, see `GetUserPersonalChatMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `[TGMessage]`
 */

    @discardableResult
    func getUserPersonalChatMessages(params: TGGetUserPersonalChatMessagesParams) async throws -> [TGMessage] {
        guard let methodURL: URL = .init(string: getMethodURL("getUserPersonalChatMessages")) else {
            throw BotError("Bad URL: \(getMethodURL("getUserPersonalChatMessages"))")
        }
        let result: [TGMessage] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
