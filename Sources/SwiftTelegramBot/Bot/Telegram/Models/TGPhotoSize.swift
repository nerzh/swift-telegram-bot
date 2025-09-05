// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents one size of a photo or a file / sticker thumbnail.

 SeeAlso Telegram Bot API Reference:
 [PhotoSize](https://core.telegram.org/bots/api#photosize)
 **/
public final class TGPhotoSize: Codable, Sendable {

    /// Custom keys for coding/decoding `PhotoSize` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case width = "width"
        case height = "height"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public let fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public let fileUniqueId: String

    /// Photo width
    public let width: Int

    /// Photo height
    public let height: Int

    /// Optional. File size in bytes
    public let fileSize: Int?

    public init (fileId: String, fileUniqueId: String, width: Int, height: Int, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.width = width
        self.height = height
        self.fileSize = fileSize
    }
}
