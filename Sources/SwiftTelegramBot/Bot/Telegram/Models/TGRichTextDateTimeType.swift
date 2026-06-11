// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Formatted date and time.

 SeeAlso Telegram Bot API Reference:
 [RichTextDateTime](https://core.telegram.org/bots/api#richtextdatetime)
 */

public enum TGRichTextDateTimeType: String, Codable, Sendable {
    case dateTime = "date_time"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextDateTimeType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}