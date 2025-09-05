// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the paid media added to a message.

 SeeAlso Telegram Bot API Reference:
 [PaidMediaInfo](https://core.telegram.org/bots/api#paidmediainfo)
 **/
public final class TGPaidMediaInfo: Codable, Sendable {

    /// Custom keys for coding/decoding `PaidMediaInfo` struct
    public enum CodingKeys: String, CodingKey {
        case starCount = "star_count"
        case paidMedia = "paid_media"
    }

    /// The number of Telegram Stars that must be paid to buy access to the media
    public let starCount: Int

    /// Information about the paid media
    public let paidMedia: [TGPaidMedia]

    public init (starCount: Int, paidMedia: [TGPaidMedia]) {
        self.starCount = starCount
        self.paidMedia = paidMedia
    }
}
