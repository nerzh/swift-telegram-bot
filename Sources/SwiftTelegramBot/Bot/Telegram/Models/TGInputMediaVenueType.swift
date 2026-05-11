// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a venue to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVenue](https://core.telegram.org/bots/api#inputmediavenue)
 */

public enum TGInputMediaVenueType: String, Codable, Sendable {
    case venue = "venue"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaVenueType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}