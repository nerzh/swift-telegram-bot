// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the default scope of bot commands. Default commands are used if no commands with a narrower scope are specified for the user.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeDefault](https://core.telegram.org/bots/api#botcommandscopedefault)
 */

public enum TGBotCommandScopeDefaultType: String, Codable, Sendable {
    case `default` = "default"
}