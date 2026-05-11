// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media is a live photo.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaLivePhoto](https://core.telegram.org/bots/api#paidmedialivephoto)
 */

public enum TGPaidMediaLivePhotoType: String, Codable, Sendable {
    case livePhoto = "live_photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGPaidMediaLivePhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}