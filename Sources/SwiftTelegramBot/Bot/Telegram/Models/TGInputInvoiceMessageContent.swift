// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the content of an invoice message to be sent as the result of an inline query.

 SeeAlso Telegram Bot API Reference:
 [InputInvoiceMessageContent](https://core.telegram.org/bots/api#inputinvoicemessagecontent)
 **/
public final class TGInputInvoiceMessageContent: Codable, Sendable {

    /// Custom keys for coding/decoding `InputInvoiceMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case payload = "payload"
        case providerToken = "provider_token"
        case currency = "currency"
        case prices = "prices"
        case maxTipAmount = "max_tip_amount"
        case suggestedTipAmounts = "suggested_tip_amounts"
        case providerData = "provider_data"
        case photoUrl = "photo_url"
        case photoSize = "photo_size"
        case photoWidth = "photo_width"
        case photoHeight = "photo_height"
        case needName = "need_name"
        case needPhoneNumber = "need_phone_number"
        case needEmail = "need_email"
        case needShippingAddress = "need_shipping_address"
        case sendPhoneNumberToProvider = "send_phone_number_to_provider"
        case sendEmailToProvider = "send_email_to_provider"
        case isFlexible = "is_flexible"
    }

    /// Product name, 1-32 characters
    public let title: String

    /// Product description, 1-255 characters
    public let description: String

    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    public let payload: String

    /// Optional. Payment provider token, obtained via @BotFather. Pass an empty string for payments in Telegram Stars.
    public let providerToken: String?

    /// Three-letter ISO 4217 currency code, see more on currencies. Pass “XTR” for payments in Telegram Stars.
    public let currency: String

    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    public let prices: [TGLabeledPrice]

    /// Optional. The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    public let maxTipAmount: Int?

    /// Optional. A JSON-serialized array of suggested amounts of tip in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    public let suggestedTipAmounts: [Int]?

    /// Optional. A JSON-serialized object for data about the invoice, which will be shared with the payment provider. A detailed description of the required fields should be provided by the payment provider.
    public let providerData: String?

    /// Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
    public let photoUrl: String?

    /// Optional. Photo size in bytes
    public let photoSize: Int?

    /// Optional. Photo width
    public let photoWidth: Int?

    /// Optional. Photo height
    public let photoHeight: Int?

    /// Optional. Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars.
    public let needName: Bool?

    /// Optional. Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars.
    public let needPhoneNumber: Bool?

    /// Optional. Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars.
    public let needEmail: Bool?

    /// Optional. Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars.
    public let needShippingAddress: Bool?

    /// Optional. Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    public let sendPhoneNumberToProvider: Bool?

    /// Optional. Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars.
    public let sendEmailToProvider: Bool?

    /// Optional. Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    public let isFlexible: Bool?

    public init (title: String, description: String, payload: String, providerToken: String? = nil, currency: String, prices: [TGLabeledPrice], maxTipAmount: Int? = nil, suggestedTipAmounts: [Int]? = nil, providerData: String? = nil, photoUrl: String? = nil, photoSize: Int? = nil, photoWidth: Int? = nil, photoHeight: Int? = nil, needName: Bool? = nil, needPhoneNumber: Bool? = nil, needEmail: Bool? = nil, needShippingAddress: Bool? = nil, sendPhoneNumberToProvider: Bool? = nil, sendEmailToProvider: Bool? = nil, isFlexible: Bool? = nil) {
        self.title = title
        self.description = description
        self.payload = payload
        self.providerToken = providerToken
        self.currency = currency
        self.prices = prices
        self.maxTipAmount = maxTipAmount
        self.suggestedTipAmounts = suggestedTipAmounts
        self.providerData = providerData
        self.photoUrl = photoUrl
        self.photoSize = photoSize
        self.photoWidth = photoWidth
        self.photoHeight = photoHeight
        self.needName = needName
        self.needPhoneNumber = needPhoneNumber
        self.needEmail = needEmail
        self.needShippingAddress = needShippingAddress
        self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
        self.sendEmailToProvider = sendEmailToProvider
        self.isFlexible = isFlexible
    }
}
