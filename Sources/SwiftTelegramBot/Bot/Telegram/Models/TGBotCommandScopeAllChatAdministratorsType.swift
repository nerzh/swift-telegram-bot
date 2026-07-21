// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all group and supergroup chat administrators.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllChatAdministrators](https://core.telegram.org/bots/api#botcommandscopeallchatadministrators)
 */

public enum TGBotCommandScopeAllChatAdministratorsType: String, Codable, Sendable {
    case allChatAdministrators = "all_chat_administrators"
}