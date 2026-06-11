// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A bot command.

 SeeAlso Telegram Bot API Reference:
 [RichTextBotCommand](https://core.telegram.org/bots/api#richtextbotcommand)
 **/
public final class TGRichTextBotCommand: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextBotCommand` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case botCommand = "bot_command"
    }

    /// Type of the rich text, always “bot_command”
    public let type: TGRichTextBotCommandType

    /// The text
    public let text: TGRichText

    /// The bot command
    public let botCommand: String

    public init (type: TGRichTextBotCommandType, text: TGRichText, botCommand: String) {
        self.type = type
        self.text = text
        self.botCommand = botCommand
    }
}
