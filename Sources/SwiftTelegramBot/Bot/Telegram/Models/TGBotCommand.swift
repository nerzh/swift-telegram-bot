// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a bot command.

 SeeAlso Telegram Bot API Reference:
 [BotCommand](https://core.telegram.org/bots/api#botcommand)
 **/
public final class TGBotCommand: Codable, Sendable {

    /// Custom keys for coding/decoding `BotCommand` struct
    public enum CodingKeys: String, CodingKey {
        case command = "command"
        case description = "description"
        case isEphemeral = "is_ephemeral"
    }

    /// Text of the command; 1-32 characters. Can contain only lowercase English letters, digits and underscores.
    public let command: String

    /// Description of the command; 1-256 characters
    public let description: String

    /// Optional. True, if the command sends an ephemeral message, which can be seen only by the sender of the message and the bot
    public let isEphemeral: Bool?

    public init (command: String, description: String, isEphemeral: Bool? = nil) {
        self.command = command
        self.description = description
        self.isEphemeral = isEphemeral
    }
}
