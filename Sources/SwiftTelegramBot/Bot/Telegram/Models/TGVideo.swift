// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a video file.

 SeeAlso Telegram Bot API Reference:
 [Video](https://core.telegram.org/bots/api#video)
 **/
public final class TGVideo: Codable, Sendable {

    /// Custom keys for coding/decoding `Video` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case width = "width"
        case height = "height"
        case duration = "duration"
        case thumbnail = "thumbnail"
        case cover = "cover"
        case startTimestamp = "start_timestamp"
        case fileName = "file_name"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public let fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public let fileUniqueId: String

    /// Video width as defined by the sender
    public let width: Int

    /// Video height as defined by the sender
    public let height: Int

    /// Duration of the video in seconds as defined by the sender
    public let duration: Int

    /// Optional. Video thumbnail
    public let thumbnail: TGPhotoSize?

    /// Optional. Available sizes of the cover of the video in the message
    public let cover: [TGPhotoSize]?

    /// Optional. Timestamp in seconds from which the video will play in the message
    public let startTimestamp: Int?

    /// Optional. Original filename as defined by the sender
    public let fileName: String?

    /// Optional. MIME type of the file as defined by the sender
    public let mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public let fileSize: Int?

    public init (fileId: String, fileUniqueId: String, width: Int, height: Int, duration: Int, thumbnail: TGPhotoSize? = nil, cover: [TGPhotoSize]? = nil, startTimestamp: Int? = nil, fileName: String? = nil, mimeType: String? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.width = width
        self.height = height
        self.duration = duration
        self.thumbnail = thumbnail
        self.cover = cover
        self.startTimestamp = startTimestamp
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
