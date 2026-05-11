// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to reply to a received guest message. On success, a SentGuestMessage object is returned.


/// Parameters container struct for `answerGuestQuery` method
public struct TGAnswerGuestQueryParams: Encodable, Sendable {

    /// Unique identifier for the query to be answered
    public let guestQueryId: String

    /// A JSON-serialized object describing the message to be sent
    public let result: TGInlineQueryResult

    /// Custom keys for coding/decoding `AnswerGuestQueryParams` struct
    public enum CodingKeys: String, CodingKey {
            case guestQueryId = "guest_query_id"
            case result = "result"
    }

    public init(guestQueryId: String, result: TGInlineQueryResult) {
            self.guestQueryId = guestQueryId
            self.result = result
    }
}


public extension TGBot {

/**
 Use this method to reply to a received guest message. On success, a SentGuestMessage object is returned.

 SeeAlso Telegram Bot API Reference:
 [AnswerGuestQueryParams](https://core.telegram.org/bots/api#answerguestquery)
 
 - Parameters:
     - params: Parameters container, see `AnswerGuestQueryParams` struct
 - Throws: Throws on errors
 - Returns: `TGSentGuestMessage`
 */

    @discardableResult
    func answerGuestQuery(params: TGAnswerGuestQueryParams) async throws -> TGSentGuestMessage {
        guard let methodURL: URL = .init(string: getMethodURL("answerGuestQuery")) else {
            throw BotError("Bad URL: \(getMethodURL("answerGuestQuery"))")
        }
        let result: TGSentGuestMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
