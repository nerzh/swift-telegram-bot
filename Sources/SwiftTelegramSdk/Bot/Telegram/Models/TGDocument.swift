// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a general file (as opposed to photos, voice messages and audio files).

 SeeAlso Telegram Bot API Reference:
 [Document](https://core.telegram.org/bots/api#document)
 **/
public final class TGDocument: Codable, Sendable {

    /// Custom keys for coding/decoding `Document` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case thumbnail = "thumbnail"
        case fileName = "file_name"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public let fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public let fileUniqueId: String

    /// Optional. Document thumbnail as defined by the sender
    public let thumbnail: TGPhotoSize?

    /// Optional. Original filename as defined by the sender
    public let fileName: String?

    /// Optional. MIME type of the file as defined by the sender
    public let mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public let fileSize: Int?

    public init (fileId: String, fileUniqueId: String, thumbnail: TGPhotoSize? = nil, fileName: String? = nil, mimeType: String? = nil, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.thumbnail = thumbnail
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
