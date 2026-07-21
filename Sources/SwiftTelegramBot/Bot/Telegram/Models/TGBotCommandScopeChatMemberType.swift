// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering a specific member of a group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatMember](https://core.telegram.org/bots/api#botcommandscopechatmember)
 */

public enum TGBotCommandScopeChatMemberType: String, Codable, Sendable {
    case chatMember = "chat_member"
}