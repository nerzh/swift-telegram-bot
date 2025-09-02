// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a phone contact.

 SeeAlso Telegram Bot API Reference:
 [Contact](https://core.telegram.org/bots/api#contact)
 **/
public final class TGContact: Codable, Sendable {

    /// Custom keys for coding/decoding `Contact` struct
    public enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case firstName = "first_name"
        case lastName = "last_name"
        case userId = "user_id"
        case vcard = "vcard"
    }

    /// Contact's phone number
    public let phoneNumber: String

    /// Contact's first name
    public let firstName: String

    /// Optional. Contact's last name
    public let lastName: String?

    /// Optional. Contact's user identifier in Telegram. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
    public let userId: Int64?

    /// Optional. Additional data about the contact in the form of a vCard
    public let vcard: String?

    public init (phoneNumber: String, firstName: String, lastName: String? = nil, userId: Int64? = nil, vcard: String? = nil) {
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.userId = userId
        self.vcard = vcard
    }
}
