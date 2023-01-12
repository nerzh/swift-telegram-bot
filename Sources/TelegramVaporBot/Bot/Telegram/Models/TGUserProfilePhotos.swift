// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represent a user's profile pictures.

 SeeAlso Telegram Bot API Reference:
 [UserProfilePhotos](https://core.telegram.org/bots/api#userprofilephotos)
 */
public final class TGUserProfilePhotos: Codable {

    /// Custom keys for coding/decoding `UserProfilePhotos` struct
    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case photos = "photos"
    }

    /// Total number of profile pictures the target user has
    public var totalCount: Int

    /// Requested profile pictures (in up to 4 sizes each)
    public var photos: [[TGPhotoSize]]

    public init (totalCount: Int, photos: [[TGPhotoSize]]) {
        self.totalCount = totalCount
        self.photos = photos
    }
}
