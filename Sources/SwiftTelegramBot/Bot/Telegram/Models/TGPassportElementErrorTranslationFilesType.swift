// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorTranslationFiles](https://core.telegram.org/bots/api#passportelementerrortranslationfiles)
 */

public enum TGPassportElementErrorTranslationFilesType: String, Codable, Sendable {
    case passport = "passport"
    case driverLicense = "driver_license"
    case identityCard = "identity_card"
    case internalPassport = "internal_passport"
    case utilityBill = "utility_bill"
    case bankStatement = "bank_statement"
    case rentalAgreement = "rental_agreement"
    case passportRegistration = "passport_registration"
    case temporaryRegistration = "temporary_registration"
}