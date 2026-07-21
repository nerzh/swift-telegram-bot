// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a chat.

 SeeAlso Telegram Bot API Reference:
 [Chat](https://core.telegram.org/bots/api#chat)
 */

public enum TGChatType: String, Codable, Sendable {
    case `private` = "private"
    case group = "group"
    case supergroup = "supergroup"
    case channel = "channel"
}