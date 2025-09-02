// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes that no specific value for the menu button was set.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonDefault](https://core.telegram.org/bots/api#menubuttondefault)
 **/
public final class TGMenuButtonDefault: Codable, Sendable {

    /// Custom keys for coding/decoding `MenuButtonDefault` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the button, must be default
    public let type: TGMenuButtonDefaultType

    public init (type: TGMenuButtonDefaultType) {
        self.type = type
    }
}
