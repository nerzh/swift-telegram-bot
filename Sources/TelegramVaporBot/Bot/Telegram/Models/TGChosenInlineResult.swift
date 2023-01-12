// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a result of an inline query that was chosen by the user and sent to their chat partner.

 SeeAlso Telegram Bot API Reference:
 [ChosenInlineResult](https://core.telegram.org/bots/api#choseninlineresult)
 */
public final class TGChosenInlineResult: Codable {

    /// Custom keys for coding/decoding `ChosenInlineResult` struct
    public enum CodingKeys: String, CodingKey {
        case resultId = "result_id"
        case from = "from"
        case location = "location"
        case inlineMessageId = "inline_message_id"
        case query = "query"
    }

    /// The unique identifier for the result that was chosen
    public var resultId: String

    /// The user that chose the result
    public var from: TGUser

    /// Optional. Sender location, only for bots that require user location
    public var location: TGLocation?

    /// Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
    public var inlineMessageId: String?

    /// The query that was used to obtain the result
    public var query: String

    public init (resultId: String, from: TGUser, location: TGLocation? = nil, inlineMessageId: String? = nil, query: String) {
        self.resultId = resultId
        self.from = from
        self.location = location
        self.inlineMessageId = inlineMessageId
        self.query = query
    }
}
