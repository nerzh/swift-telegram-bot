// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send an answer to a query from a widget. The query must be answered within 15 seconds. The answer is received only by the widget that sent the query and doesn't change data of the widget; use editMessageWidgetData or editSharedWidgetData to change it. On success, True is returned.


/// Parameters container struct for `answerWidgetQuery` method
public struct TGAnswerWidgetQueryParams: Encodable, Sendable {

    /// Unique identifier for the query to be answered
    public let widgetQueryId: String

    /// Data to be returned to the widget, 0-1024 bytes
    public let data: String?

    /// Custom keys for coding/decoding `AnswerWidgetQueryParams` struct
    public enum CodingKeys: String, CodingKey {
            case widgetQueryId = "widget_query_id"
            case data = "data"
    }

    public init(widgetQueryId: String, data: String? = nil) {
            self.widgetQueryId = widgetQueryId
            self.data = data
    }
}


public extension TGBot {

/**
 Use this method to send an answer to a query from a widget. The query must be answered within 15 seconds. The answer is received only by the widget that sent the query and doesn't change data of the widget; use editMessageWidgetData or editSharedWidgetData to change it. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [AnswerWidgetQueryParams](https://core.telegram.org/bots/api#answerwidgetquery)
 
 - Parameters:
     - params: Parameters container, see `AnswerWidgetQueryParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func answerWidgetQuery(params: TGAnswerWidgetQueryParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("answerWidgetQuery")) else {
            throw BotError("Bad URL: \(getMethodURL("answerWidgetQuery"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
