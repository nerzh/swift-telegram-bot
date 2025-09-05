// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media is a photo.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaPhoto](https://core.telegram.org/bots/api#paidmediaphoto)
 */

public enum TGPaidMediaPhotoType: String, Codable, Sendable {
    case photo = "photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPaidMediaPhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}