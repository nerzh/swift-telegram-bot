// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned.


/// Parameters container struct for `answerWebAppQuery` method
public struct TGAnswerWebAppQueryParams: Encodable, Sendable {

    /// Unique identifier for the query to be answered
    public let webAppQueryId: String

    /// A JSON-serialized object describing the message to be sent
    public let result: TGInlineQueryResult

    /// Custom keys for coding/decoding `AnswerWebAppQueryParams` struct
    public enum CodingKeys: String, CodingKey {
            case webAppQueryId = "web_app_query_id"
            case result = "result"
    }

    public init(webAppQueryId: String, result: TGInlineQueryResult) {
            self.webAppQueryId = webAppQueryId
            self.result = result
    }
}


public extension TGBot {

/**
 Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned.

 SeeAlso Telegram Bot API Reference:
 [AnswerWebAppQueryParams](https://core.telegram.org/bots/api#answerwebappquery)
 
 - Parameters:
     - params: Parameters container, see `AnswerWebAppQueryParams` struct
 - Throws: Throws on errors
 - Returns: `TGSentWebAppMessage`
 */

    @discardableResult
    func answerWebAppQuery(params: TGAnswerWebAppQueryParams) async throws -> TGSentWebAppMessage {
        guard let methodURL: URL = .init(string: getMethodURL("answerWebAppQuery")) else {
            throw BotError("Bad URL: \(getMethodURL("answerWebAppQuery"))")
        }
        let result: TGSentWebAppMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
