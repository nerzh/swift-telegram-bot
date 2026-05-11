// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media is a live photo.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaLivePhoto](https://core.telegram.org/bots/api#paidmedialivephoto)
 **/
public final class TGPaidMediaLivePhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `PaidMediaLivePhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case livePhoto = "live_photo"
    }

    /// Type of the paid media, always “live_photo”
    public let type: TGPaidMediaLivePhotoType

    /// The photo
    public let livePhoto: TGLivePhoto

    public init (type: TGPaidMediaLivePhotoType, livePhoto: TGLivePhoto) {
        self.type = type
        self.livePhoto = livePhoto
    }
}
