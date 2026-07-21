// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
 */

public enum TGInlineQueryResultContactType: String, Codable, Sendable {
    case contact = "contact"
}