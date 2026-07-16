// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a photo, corresponding to the HTML tag <img>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockPhoto](https://core.telegram.org/bots/api#inputrichblockphoto)
 */

public enum TGInputRichBlockPhotoType: String, Codable, Sendable {
    case photo = "photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}