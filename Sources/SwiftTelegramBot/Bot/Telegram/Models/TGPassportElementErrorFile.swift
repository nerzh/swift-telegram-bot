// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
 **/
public final class TGPassportElementErrorFile: Codable, Sendable {

    /// Custom keys for coding/decoding `PassportElementErrorFile` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHash = "file_hash"
        case message = "message"
    }

    /// Error source, must be file
    public let source: String

    /// The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    public let type: TGPassportElementErrorFileType

    /// Base64-encoded file hash
    public let fileHash: String

    /// Error message
    public let message: String

    public init (source: String, type: TGPassportElementErrorFileType, fileHash: String, message: String) {
        self.source = source
        self.type = type
        self.fileHash = fileHash
        self.message = message
    }
}
