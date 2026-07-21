// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorReverseSide](https://core.telegram.org/bots/api#passportelementerrorreverseside)
 */

public enum TGPassportElementErrorReverseSideType: String, Codable, Sendable {
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
}