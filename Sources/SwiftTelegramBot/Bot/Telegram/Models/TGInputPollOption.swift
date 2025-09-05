// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about one answer option in a poll to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputPollOption](https://core.telegram.org/bots/api#inputpolloption)
 **/
public final class TGInputPollOption: Codable, Sendable {

    /// Custom keys for coding/decoding `InputPollOption` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case textParseMode = "text_parse_mode"
        case textEntities = "text_entities"
    }

    /// Option text, 1-100 characters
    public let text: String

    /// Optional. Mode for parsing entities in the text. See formatting options for more details. Currently, only custom emoji entities are allowed
    public let textParseMode: String?

    /// Optional. A JSON-serialized list of special entities that appear in the poll option text. It can be specified instead of text_parse_mode
    public let textEntities: [TGMessageEntity]?

    public init (text: String, textParseMode: String? = nil, textEntities: [TGMessageEntity]? = nil) {
        self.text = text
        self.textParseMode = textParseMode
        self.textEntities = textEntities
    }
}
