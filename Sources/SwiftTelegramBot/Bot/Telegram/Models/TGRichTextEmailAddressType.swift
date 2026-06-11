// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with an email address.

 SeeAlso Telegram Bot API Reference:
 [RichTextEmailAddress](https://core.telegram.org/bots/api#richtextemailaddress)
 */

public enum TGRichTextEmailAddressType: String, Codable, Sendable {
    case emailAddress = "email_address"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextEmailAddressType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}