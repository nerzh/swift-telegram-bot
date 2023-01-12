// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
 */
public final class TGPassportElementErrorFrontSide: Codable {

    /// Custom keys for coding/decoding `PassportElementErrorFrontSide` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHash = "file_hash"
        case message = "message"
    }

    /// Error source, must be front_side
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
    public var type: String

    /// Base64-encoded hash of the file with the front side of the document
    public var fileHash: String

    /// Error message
    public var message: String

    public init (source: String, type: String, fileHash: String, message: String) {
        self.source = source
        self.type = type
        self.fileHash = fileHash
        self.message = message
    }
}
