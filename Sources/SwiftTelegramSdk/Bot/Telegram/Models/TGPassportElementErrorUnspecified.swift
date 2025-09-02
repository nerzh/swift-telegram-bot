// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue in an unspecified place. The error is considered resolved when new data is added.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorUnspecified](https://core.telegram.org/bots/api#passportelementerrorunspecified)
 **/
public final class TGPassportElementErrorUnspecified: Codable, Sendable {

    /// Custom keys for coding/decoding `PassportElementErrorUnspecified` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case type = "type"
        case elementHash = "element_hash"
        case message = "message"
    }

    /// Error source, must be unspecified
    public let source: String

    /// Type of element of the user's Telegram Passport which has the issue
    public let type: String

    /// Base64-encoded element hash
    public let elementHash: String

    /// Error message
    public let message: String

    public init (source: String, type: String, elementHash: String, message: String) {
        self.source = source
        self.type = type
        self.elementHash = elementHash
        self.message = message
    }
}
