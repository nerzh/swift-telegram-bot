// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatAdministrators](https://core.telegram.org/bots/api#botcommandscopechatadministrators)
 **/
public final class TGBotCommandScopeChatAdministrators: Codable, Sendable {

    /// Custom keys for coding/decoding `BotCommandScopeChatAdministrators` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case chatId = "chat_id"
    }

    /// Scope type, must be chat_administrators
    public let type: TGBotCommandScopeChatAdministratorsType

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername). Channel direct messages chats and channel chats aren't supported.
    public let chatId: TGChatId

    public init (type: TGBotCommandScopeChatAdministratorsType, chatId: TGChatId) {
        self.type = type
        self.chatId = chatId
    }
}
