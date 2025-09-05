// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the scope of bot commands, covering all group and supergroup chat administrators.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllChatAdministrators](https://core.telegram.org/bots/api#botcommandscopeallchatadministrators)
 */

public enum TGBotCommandScopeAllChatAdministratorsType: String, Codable, Sendable {
    case allChatAdministrators = "all_chat_administrators"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGBotCommandScopeAllChatAdministratorsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}