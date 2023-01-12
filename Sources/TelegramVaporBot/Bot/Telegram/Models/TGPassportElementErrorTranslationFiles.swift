// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorTranslationFiles](https://core.telegram.org/bots/api#passportelementerrortranslationfiles)
 */
public final class TGPassportElementErrorTranslationFiles: Codable {

    /// Custom keys for coding/decoding `PassportElementErrorTranslationFiles` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHashes = "file_hashes"
        case message = "message"
    }

    /// Error source, must be translation_files
    public var source: String

    /// Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
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
