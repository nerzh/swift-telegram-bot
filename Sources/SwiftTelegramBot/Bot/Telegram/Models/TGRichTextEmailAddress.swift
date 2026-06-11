// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with an email address.

 SeeAlso Telegram Bot API Reference:
 [RichTextEmailAddress](https://core.telegram.org/bots/api#richtextemailaddress)
 **/
public final class TGRichTextEmailAddress: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextEmailAddress` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case emailAddress = "email_address"
    }

    /// Type of the rich text, always “email_address”
    public let type: TGRichTextEmailAddressType

    /// The text
    public let text: TGRichText

    /// The email address
    public let emailAddress: String

    public init (type: TGRichTextEmailAddressType, text: TGRichText, emailAddress: String) {
        self.type = type
        self.text = text
        self.emailAddress = emailAddress
    }
}
