// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a sticker file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaSticker](https://core.telegram.org/bots/api#inputmediasticker)
 **/
public final class TGInputMediaSticker: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaSticker` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case emoji = "emoji"
    }

    /// Type of the media, must be sticker
    public let type: TGInputMediaStickerType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a .WEBP sticker from the Internet, or pass “attach://<file_attach_name>” to upload a new .WEBP, .TGS, or .WEBM sticker using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public let media: String

    /// Optional. Emoji associated with the sticker; only for just uploaded stickers
    public let emoji: String?

    public init (type: TGInputMediaStickerType, media: String, emoji: String? = nil) {
        self.type = type
        self.media = media
        self.emoji = emoji
    }
}
