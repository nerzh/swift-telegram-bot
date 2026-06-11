// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with a phone number.

 SeeAlso Telegram Bot API Reference:
 [RichTextPhoneNumber](https://core.telegram.org/bots/api#richtextphonenumber)
 **/
public final class TGRichTextPhoneNumber: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextPhoneNumber` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case phoneNumber = "phone_number"
    }

    /// Type of the rich text, always “phone_number”
    public let type: TGRichTextPhoneNumberType

    /// The text
    public let text: TGRichText

    /// The phone number
    public let phoneNumber: String

    public init (type: TGRichTextPhoneNumberType, text: TGRichText, phoneNumber: String) {
        self.type = type
        self.text = text
        self.phoneNumber = phoneNumber
    }
}
