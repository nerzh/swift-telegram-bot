// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media to send is a live photo.

 SeeAlso Telegram Bot API Reference:
 [InputPaidMediaLivePhoto](https://core.telegram.org/bots/api#inputpaidmedialivephoto)
 */

public enum TGInputPaidMediaLivePhotoType: String, Codable, Sendable {
    case livePhoto = "live_photo"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputPaidMediaLivePhotoType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}