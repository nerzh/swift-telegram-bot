// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFiles](https://core.telegram.org/bots/api#passportelementerrorfiles)
 */

public enum TGPassportElementErrorFilesType: String, Codable, Sendable {
    case utilityBill = "utility_bill"
    case bankStatement = "bank_statement"
    case rentalAgreement = "rental_agreement"
    case passportRegistration = "passport_registration"
    case temporaryRegistration = "temporary_registration"
}