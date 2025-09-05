// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
 **/
public final class TGInlineQueryResultContact: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultContact` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case phoneNumber = "phone_number"
        case firstName = "first_name"
        case lastName = "last_name"
        case vcard = "vcard"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
        case thumbnailUrl = "thumbnail_url"
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }

    /// Type of the result, must be contact
    public let type: TGInlineQueryResultContactType

    /// Unique identifier for this result, 1-64 Bytes
    public let id: String

    /// Contact's phone number
    public let phoneNumber: String

    /// Contact's first name
    public let firstName: String

    /// Optional. Contact's last name
    public let lastName: String?

    /// Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
    public let vcard: String?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the contact
    public let inputMessageContent: TGInputMessageContent?

    /// Optional. Url of the thumbnail for the result
    public let thumbnailUrl: String?

    /// Optional. Thumbnail width
    public let thumbnailWidth: Int?

    /// Optional. Thumbnail height
    public let thumbnailHeight: Int?

    public init (type: TGInlineQueryResultContactType, id: String, phoneNumber: String, firstName: String, lastName: String? = nil, vcard: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil, thumbnailUrl: String? = nil, thumbnailWidth: Int? = nil, thumbnailHeight: Int? = nil) {
        self.type = type
        self.id = id
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.vcard = vcard
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailWidth = thumbnailWidth
        self.thumbnailHeight = thumbnailHeight
    }
}
