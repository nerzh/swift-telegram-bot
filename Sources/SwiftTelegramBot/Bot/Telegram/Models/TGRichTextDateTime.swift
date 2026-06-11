// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Formatted date and time.

 SeeAlso Telegram Bot API Reference:
 [RichTextDateTime](https://core.telegram.org/bots/api#richtextdatetime)
 **/
public final class TGRichTextDateTime: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextDateTime` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case unixTime = "unix_time"
        case dateTimeFormat = "date_time_format"
    }

    /// Type of the rich text, always “date_time”
    public let type: TGRichTextDateTimeType

    /// The text
    public let text: TGRichText

    /// The Unix time associated with the entity
    public let unixTime: Int

    /// The string that defines the formatting of the date and time. See date-time entity formatting for more details.
    public let dateTimeFormat: String

    public init (type: TGRichTextDateTimeType, text: TGRichText, unixTime: Int, dateTimeFormat: String) {
        self.type = type
        self.text = text
        self.unixTime = unixTime
        self.dateTimeFormat = dateTimeFormat
    }
}
