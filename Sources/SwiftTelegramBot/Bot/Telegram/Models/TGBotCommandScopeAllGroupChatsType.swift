// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all group and supergroup chats.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllGroupChats](https://core.telegram.org/bots/api#botcommandscopeallgroupchats)
 */

public enum TGBotCommandScopeAllGroupChatsType: String, Codable, Sendable {
    case allGroupChats = "all_group_chats"
}