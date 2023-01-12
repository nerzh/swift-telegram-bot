// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorSelfie](https://core.telegram.org/bots/api#passportelementerrorselfie)
 */
public final class TGPassportElementErrorSelfie: Codable {

    /// Custom keys for coding/decoding `PassportElementErrorSelfie` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHash = "file_hash"
        case message = "message"
    }

    /// Error source, must be selfie
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
    public var type: String

    /// Base64-encoded hash of the file with the selfie
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
