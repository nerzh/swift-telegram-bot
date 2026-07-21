// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains full information about a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatFullInfo](https://core.telegram.org/bots/api#chatfullinfo)
 */

public enum TGChatFullInfoType: String, Codable, Sendable {
    case `private` = "private"
    case group = "group"
    case supergroup = "supergroup"
    case channel = "channel"
}