// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the content of a contact message to be sent as the result of an inline query.

 SeeAlso Telegram Bot API Reference:
 [InputContactMessageContent](https://core.telegram.org/bots/api#inputcontactmessagecontent)
 */
public final class TGInputContactMessageContent: Codable {

    /// Custom keys for coding/decoding `InputContactMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case firstName = "first_name"
        case lastName = "last_name"
        case vcard = "vcard"
    }

    /// Contact's phone number
    public var phoneNumber: String

    /// Contact's first name
    public var firstName: String

    /// Optional. Contact's last name
    public var lastName: String?

    /// Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
    public var vcard: String?

    public init (phoneNumber: String, firstName: String, lastName: String? = nil, vcard: String? = nil) {
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.vcard = vcard
    }
}
