// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering a specific chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChat](https://core.telegram.org/bots/api#botcommandscopechat)
 */

public enum TGBotCommandScopeChatType: String, Codable, Sendable {
    case chat = "chat"
}