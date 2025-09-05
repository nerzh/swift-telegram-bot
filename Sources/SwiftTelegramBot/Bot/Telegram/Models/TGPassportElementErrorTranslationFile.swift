// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorTranslationFile](https://core.telegram.org/bots/api#passportelementerrortranslationfile)
 **/
public final class TGPassportElementErrorTranslationFile: Codable, Sendable {

    /// Custom keys for coding/decoding `PassportElementErrorTranslationFile` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHash = "file_hash"
        case message = "message"
    }

    /// Error source, must be translation_file
    public let source: String

    /// Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
    public let type: TGPassportElementErrorTranslationFileType

    /// Base64-encoded file hash
    public let fileHash: String

    /// Error message
    public let message: String

    public init (source: String, type: TGPassportElementErrorTranslationFileType, fileHash: String, message: String) {
        self.source = source
        self.type = type
        self.fileHash = fileHash
        self.message = message
    }
}
