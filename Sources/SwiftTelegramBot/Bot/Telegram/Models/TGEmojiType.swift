// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes an emoji. Currently, it can be one of
 EmojiTypeEmoji
 EmojiTypeCustomEmoji

 SeeAlso Telegram Bot API Reference:
 [EmojiType](https://core.telegram.org/bots/api#emojitype)
 **/
public enum TGEmojiType: Codable, Sendable {
    case emojiTypeEmoji(TGEmojiTypeEmoji)
    case emojiTypeCustomEmoji(TGEmojiTypeCustomEmoji)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGEmojiTypeEmoji.self) {
            self = .emojiTypeEmoji(value)
        } else if let value = try? container.decode(TGEmojiTypeCustomEmoji.self) {
            self = .emojiTypeCustomEmoji(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE EmojiType.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .emojiTypeEmoji(value):
            try container.encode(value)
        case let .emojiTypeCustomEmoji(value):
            try container.encode(value)
        }
    }
}
