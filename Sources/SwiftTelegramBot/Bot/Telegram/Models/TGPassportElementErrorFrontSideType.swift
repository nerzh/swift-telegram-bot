// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
 */

public enum TGPassportElementErrorFrontSideType: String, Codable, Sendable {
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
}