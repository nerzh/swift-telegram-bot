// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a sticker file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaSticker](https://core.telegram.org/bots/api#inputmediasticker)
 */

public enum TGInputMediaStickerType: String, Codable, Sendable {
    case sticker = "sticker"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaStickerType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}