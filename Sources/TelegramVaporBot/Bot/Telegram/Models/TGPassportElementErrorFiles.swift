// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFiles](https://core.telegram.org/bots/api#passportelementerrorfiles)
 */
public final class TGPassportElementErrorFiles: Codable {

    /// Custom keys for coding/decoding `PassportElementErrorFiles` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHashes = "file_hashes"
        case message = "message"
    }

    /// Error source, must be files
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    public var type: String

    /// List of base64-encoded file hashes
    public var fileHashes: [String]

    /// Error message
    public var message: String

    public init (source: String, type: String, fileHashes: [String], message: String) {
        self.source = source
        self.type = type
        self.fileHashes = fileHashes
        self.message = message
    }
}
