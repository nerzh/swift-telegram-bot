// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes.

 SeeAlso Telegram Bot API Reference:
 [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
 */

public enum TGPassportElementErrorFileType: String, Codable, Sendable {
    case utilityBill = "utility_bill"
    case bankStatement = "bank_statement"
    case rentalAgreement = "rental_agreement"
    case passportRegistration = "passport_registration"
    case temporaryRegistration = "temporary_registration"
}