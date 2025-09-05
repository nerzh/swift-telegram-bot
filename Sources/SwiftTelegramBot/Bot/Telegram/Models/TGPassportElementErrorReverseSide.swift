// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
 **/
public final class TGPassportElementErrorReverseSide: Codable, Sendable {

    /// Custom keys for coding/decoding `PassportElementErrorReverseSide` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case fileHash = "file_hash"
        case message = "message"
    }

    /// Error source, must be reverse_side
    public let source: String

    /// The section of the user's Telegram Passport which has the issue, one of “driver_license”, “identity_card”
    public let type: TGPassportElementErrorReverseSideType

    /// Base64-encoded hash of the file with the reverse side of the document
    public let fileHash: String

    /// Error message
    public let message: String

    public init (source: String, type: TGPassportElementErrorReverseSideType, fileHash: String, message: String) {
        self.source = source
        self.type = type
        self.fileHash = fileHash
        self.message = message
    }
}
