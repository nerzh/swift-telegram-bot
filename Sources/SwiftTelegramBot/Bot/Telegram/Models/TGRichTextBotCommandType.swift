// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A bot command.

 SeeAlso Telegram Bot API Reference:
 [RichTextBotCommand](https://core.telegram.org/bots/api#richtextbotcommand)
 */

public enum TGRichTextBotCommandType: String, Codable, Sendable {
    case botCommand = "bot_command"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextBotCommandType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}