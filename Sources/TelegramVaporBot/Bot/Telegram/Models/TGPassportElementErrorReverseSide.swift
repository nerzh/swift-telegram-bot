// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
 */
public final class TGPassportElementErrorReverseSide: Codable {

    /// Custom keys for coding/decoding `PassportElementErrorReverseSide` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHash = "file_hash"
        case message = "message"
    }

    /// Error source, must be reverse_side
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “driver_license”, “identity_card”
    public var type: String

    /// Base64-encoded hash of the file with the reverse side of the document
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
