// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with an email address.

 SeeAlso Telegram Bot API Reference:
 [RichTextEmailAddress](https://core.telegram.org/bots/api#richtextemailaddress)
 */

public enum TGRichTextEmailAddressType: String, Codable, Sendable {
    case emailAddress = "email_address"
}