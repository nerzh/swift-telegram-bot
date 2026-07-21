// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a sticker.

 SeeAlso Telegram Bot API Reference:
 [Sticker](https://core.telegram.org/bots/api#sticker)
 */

public enum TGStickerType: String, Codable, Sendable {
    case regular = "regular"
    case mask = "mask"
    case customEmoji = "custom_emoji"
}