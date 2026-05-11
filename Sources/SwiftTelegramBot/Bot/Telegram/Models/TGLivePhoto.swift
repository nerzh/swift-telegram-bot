// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a live photo.

 SeeAlso Telegram Bot API Reference:
 [LivePhoto](https://core.telegram.org/bots/api#livephoto)
 **/
public final class TGLivePhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `LivePhoto` struct
    public enum CodingKeys: String, CodingKey {
        case photo = "photo"
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Optional. Available sizes of the corresponding static photo
    public let photo: [TGPhotoSize]?

    /// Identifier for the video file which can be used to download or reuse the file
    public let fileId: String

    /// Unique identifier for the video file which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public let fileUniqueId: String

    /// Video width as defined by the sender
    public let width: Int

    /// Video height as defined by the sender
    public let height: Int

    /// Duration of the video in seconds as defined by the sender
    public let duration: Int

    /// Optional. MIME type of the file as defined by the sender
    public let mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public let fileSize: Int?

    public init (photo: [TGPhotoSize]? = nil, fileId: String, fileUniqueId: String, width: Int, height: Int, duration: Int, mimeType: String? = nil, fileSize: Int? = nil) {
        self.photo = photo
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.width = width
        self.height = height
        self.duration = duration
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
