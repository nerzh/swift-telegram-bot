// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the theme of the screen for sharing a link to a user or a chat. Currently, it can be one of
 ChatShareThemeEmoji
 ChatShareThemeUniqueGift

 SeeAlso Telegram Bot API Reference:
 [ChatShareTheme](https://core.telegram.org/bots/api#chatsharetheme)
 **/
public enum TGChatShareTheme: Codable, Sendable {
    case chatShareThemeEmoji(TGChatShareThemeEmoji)
    case chatShareThemeUniqueGift(TGChatShareThemeUniqueGift)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGChatShareThemeEmoji.self) {
            self = .chatShareThemeEmoji(value)
        } else if let value = try? container.decode(TGChatShareThemeUniqueGift.self) {
            self = .chatShareThemeUniqueGift(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE ChatShareTheme.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .chatShareThemeEmoji(value):
            try container.encode(value)
        case let .chatShareThemeUniqueGift(value):
            try container.encode(value)
        }
    }
}
