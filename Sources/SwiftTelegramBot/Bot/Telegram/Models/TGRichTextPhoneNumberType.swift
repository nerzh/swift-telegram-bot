// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with a phone number.

 SeeAlso Telegram Bot API Reference:
 [RichTextPhoneNumber](https://core.telegram.org/bots/api#richtextphonenumber)
 */

public enum TGRichTextPhoneNumberType: String, Codable, Sendable {
    case phoneNumber = "phone_number"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextPhoneNumberType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}