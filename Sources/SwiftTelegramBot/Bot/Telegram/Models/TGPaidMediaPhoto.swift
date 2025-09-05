// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media is a photo.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaPhoto](https://core.telegram.org/bots/api#paidmediaphoto)
 **/
public final class TGPaidMediaPhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `PaidMediaPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case photo = "photo"
    }

    /// Type of the paid media, always “photo”
    public let type: TGPaidMediaPhotoType

    /// The photo
    public let photo: [TGPhotoSize]

    public init (type: TGPaidMediaPhotoType, photo: [TGPhotoSize]) {
        self.type = type
        self.photo = photo
    }
}
