// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a sticker to be added to a sticker set.

 SeeAlso Telegram Bot API Reference:
 [InputSticker](https://core.telegram.org/bots/api#inputsticker)
 **/
public final class TGInputSticker: Codable, Sendable {

    /// Custom keys for coding/decoding `InputSticker` struct
    public enum CodingKeys: String, CodingKey {
        case sticker = "sticker"
        case format = "format"
        case emojiList = "emoji_list"
        case maskPosition = "mask_position"
        case keywords = "keywords"
    }

    /// The added sticker. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new file using multipart/form-data under <file_attach_name> name. Animated and video stickers can't be uploaded via HTTP URL. More information on Sending Files »
    public let sticker: String

    /// Format of the added sticker, must be one of “static” for a .WEBP or .PNG image, “animated” for a .TGS animation, “video” for a .WEBM video
    public let format: String

    /// List of 1-20 emoji associated with the sticker
    public let emojiList: [String]

    /// Optional. Position where the mask should be placed on faces. For “mask” stickers only.
    public let maskPosition: TGMaskPosition?

    /// Optional. List of 0-20 search keywords for the sticker with total length of up to 64 characters. For “regular” and “custom_emoji” stickers only.
    public let keywords: [String]?

    public init (sticker: String, format: String, emojiList: [String], maskPosition: TGMaskPosition? = nil, keywords: [String]? = nil) {
        self.sticker = sticker
        self.format = format
        self.emojiList = emojiList
        self.maskPosition = maskPosition
        self.keywords = keywords
    }
}
