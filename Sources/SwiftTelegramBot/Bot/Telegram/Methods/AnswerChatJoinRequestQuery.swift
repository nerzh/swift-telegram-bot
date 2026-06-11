// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to process a received chat join request query. Returns True on success.


/// Parameters container struct for `answerChatJoinRequestQuery` method
public struct TGAnswerChatJoinRequestQueryParams: Encodable, Sendable {

    /// Unique identifier of the join request query
    public let chatJoinRequestQueryId: String

    /// Result of the query. Must be either “approve” to allow the user to join the chat, “decline” to disallow the user to join the chat, or “queue” to leave the decision to other administrators.
    public let result: String

    /// Custom keys for coding/decoding `AnswerChatJoinRequestQueryParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatJoinRequestQueryId = "chat_join_request_query_id"
            case result = "result"
    }

    public init(chatJoinRequestQueryId: String, result: String) {
            self.chatJoinRequestQueryId = chatJoinRequestQueryId
            self.result = result
    }
}


public extension TGBot {

/**
 Use this method to process a received chat join request query. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [AnswerChatJoinRequestQueryParams](https://core.telegram.org/bots/api#answerchatjoinrequestquery)
 
 - Parameters:
     - params: Parameters container, see `AnswerChatJoinRequestQueryParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func answerChatJoinRequestQuery(params: TGAnswerChatJoinRequestQueryParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("answerChatJoinRequestQuery")) else {
            throw BotError("Bad URL: \(getMethodURL("answerChatJoinRequestQuery"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
