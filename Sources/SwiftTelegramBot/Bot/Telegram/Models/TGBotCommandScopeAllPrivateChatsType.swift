// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all private chats.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllPrivateChats](https://core.telegram.org/bots/api#botcommandscopeallprivatechats)
 */

public enum TGBotCommandScopeAllPrivateChatsType: String, Codable, Sendable {
    case allPrivateChats = "all_private_chats"
}