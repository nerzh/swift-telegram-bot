// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a location to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaLocation](https://core.telegram.org/bots/api#inputmedialocation)
 */

public enum TGInputMediaLocationType: String, Codable, Sendable {
    case location = "location"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaLocationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}