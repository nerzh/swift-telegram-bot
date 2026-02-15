// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the audios displayed on a user's profile.

 SeeAlso Telegram Bot API Reference:
 [UserProfileAudios](https://core.telegram.org/bots/api#userprofileaudios)
 **/
public final class TGUserProfileAudios: Codable, Sendable {

    /// Custom keys for coding/decoding `UserProfileAudios` struct
    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case audios = "audios"
    }

    /// Total number of profile audios for the target user
    public let totalCount: Int

    /// Requested profile audios
    public let audios: [TGAudio]

    public init (totalCount: Int, audios: [TGAudio]) {
        self.totalCount = totalCount
        self.audios = audios
    }
}
