// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a menu button, which opens the bot's list of commands.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonCommands](https://core.telegram.org/bots/api#menubuttoncommands)
 **/
public final class TGMenuButtonCommands: Codable, Sendable {

    /// Custom keys for coding/decoding `MenuButtonCommands` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the button, must be commands
    public let type: TGMenuButtonCommandsType

    public init (type: TGMenuButtonCommandsType) {
        self.type = type
    }
}
