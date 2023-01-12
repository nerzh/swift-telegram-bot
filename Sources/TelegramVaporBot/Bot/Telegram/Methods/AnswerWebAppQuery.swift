// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned.


/// Parameters container struct for `answerWebAppQuery` method
public struct TGAnswerWebAppQueryParams: Encodable {

    /// Unique identifier for the query to be answered
    public var webAppQueryId: String

    /// A JSON-serialized object describing the message to be sent
    public var result: TGInlineQueryResult

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
 - Returns: EventLoopFuture of `TGSentWebAppMessage` type
 */
    @discardableResult
    func answerWebAppQuery(params: TGAnswerWebAppQueryParams) throws -> EventLoopFuture<TGSentWebAppMessage> {
        let methodURL: URI = .init(string: getMethodURL("answerWebAppQuery"))
        let future: EventLoopFuture<TGSentWebAppMessage> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
