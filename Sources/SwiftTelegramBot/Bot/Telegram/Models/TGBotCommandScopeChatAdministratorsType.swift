// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatAdministrators](https://core.telegram.org/bots/api#botcommandscopechatadministrators)
 */

public enum TGBotCommandScopeChatAdministratorsType: String, Codable, Sendable {
    case chatAdministrators = "chat_administrators"
}