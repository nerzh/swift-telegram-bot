// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send answers to an inline query. On success, True is returned.
/// No more than 50 results per query are allowed.


/// Parameters container struct for `answerInlineQuery` method
public struct TGAnswerInlineQueryParams: Encodable {

    /// Unique identifier for the answered query
    public var inlineQueryId: String

    /// A JSON-serialized array of results for the inline query
    public var results: [TGInlineQueryResult]

    /// The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
    public var cacheTime: Int?

    /// Pass True if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query
    public var isPersonal: Bool?

    /// Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination. Offset length can't exceed 64 bytes.
    public var nextOffset: String?

    /// If passed, clients will display a button with specified text that switches the user to a private chat with the bot and sends the bot a start message with the parameter switch_pm_parameter
    public var switchPmText: String?

    /// Deep-linking parameter for the /start message sent to the bot when user presses the switch button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.
    /// 
    /// Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a 'Connect your YouTube account' button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an OAuth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.
    public var switchPmParameter: String?

    /// Custom keys for coding/decoding `AnswerInlineQueryParams` struct
    public enum CodingKeys: String, CodingKey {
            case inlineQueryId = "inline_query_id"
            case results = "results"
            case cacheTime = "cache_time"
            case isPersonal = "is_personal"
            case nextOffset = "next_offset"
            case switchPmText = "switch_pm_text"
            case switchPmParameter = "switch_pm_parameter"
    }

    public init(inlineQueryId: String, results: [TGInlineQueryResult], cacheTime: Int? = nil, isPersonal: Bool? = nil, nextOffset: String? = nil, switchPmText: String? = nil, switchPmParameter: String? = nil) {
            self.inlineQueryId = inlineQueryId
            self.results = results
            self.cacheTime = cacheTime
            self.isPersonal = isPersonal
            self.nextOffset = nextOffset
            self.switchPmText = switchPmText
            self.switchPmParameter = switchPmParameter
    }
}


public extension TGBot {

/**
 Use this method to send answers to an inline query. On success, True is returned.
 No more than 50 results per query are allowed.

 SeeAlso Telegram Bot API Reference:
 [AnswerInlineQueryParams](https://core.telegram.org/bots/api#answerinlinequery)
 
 - Parameters:
     - params: Parameters container, see `AnswerInlineQueryParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func answerInlineQuery(params: TGAnswerInlineQueryParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("answerInlineQuery"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
