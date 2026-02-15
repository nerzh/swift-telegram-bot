// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a video file of a specific quality.

 SeeAlso Telegram Bot API Reference:
 [VideoQuality](https://core.telegram.org/bots/api#videoquality)
 **/
public final class TGVideoQuality: Codable, Sendable {

    /// Custom keys for coding/decoding `VideoQuality` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case width = "width"
        case height = "height"
        case codec = "codec"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public let fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public let fileUniqueId: String

    /// Video width
    public let width: Int

    /// Video height
    public let height: Int

    /// Codec that was used to encode the video, for example, “h264”, “h265”, or “av01”
    public let codec: String

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public let fileSize: Int?

    public init (fileId: String, fileUniqueId: String, width: Int, height: Int, codec: String, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.width = width
        self.height = height
        self.codec = codec
        self.fileSize = fileSize
    }
}
