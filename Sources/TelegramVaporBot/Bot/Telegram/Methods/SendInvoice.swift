// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to send invoices. On success, the sent Message is returned.


/// Parameters container struct for `sendInvoice` method
public struct TGSendInvoiceParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public var messageThreadId: Int?

    /// Product name, 1-32 characters
    public var title: String

    /// Product description, 1-255 characters
    public var description: String

    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
    public var payload: String

    /// Payment provider token, obtained via @BotFather
    public var providerToken: String

    /// Three-letter ISO 4217 currency code, see more on currencies
    public var currency: String

    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
    public var prices: [TGLabeledPrice]

    /// The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0
    public var maxTipAmount: Int?

    /// A JSON-serialized array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    public var suggestedTipAmounts: [Int]?

    /// Unique deep-linking parameter. If left empty, forwarded copies of the sent message will have a Pay button, allowing multiple users to pay directly from the forwarded message, using the same invoice. If non-empty, forwarded copies of the sent message will have a URL button with a deep link to the bot (instead of a Pay button), with the value used as the start parameter
    public var startParameter: String?

    /// JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    public var providerData: String?

    /// URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
    public var photoUrl: String?

    /// Photo size in bytes
    public var photoSize: Int?

    /// Photo width
    public var photoWidth: Int?

    /// Photo height
    public var photoHeight: Int?

    /// Pass True if you require the user's full name to complete the order
    public var needName: Bool?

    /// Pass True if you require the user's phone number to complete the order
    public var needPhoneNumber: Bool?

    /// Pass True if you require the user's email address to complete the order
    public var needEmail: Bool?

    /// Pass True if you require the user's shipping address to complete the order
    public var needShippingAddress: Bool?

    /// Pass True if the user's phone number should be sent to provider
    public var sendPhoneNumberToProvider: Bool?

    /// Pass True if the user's email address should be sent to provider
    public var sendEmailToProvider: Bool?

    /// Pass True if the final price depends on the shipping method
    public var isFlexible: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
    public var replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `SendInvoiceParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case title = "title"
            case description = "description"
            case payload = "payload"
            case providerToken = "provider_token"
            case currency = "currency"
            case prices = "prices"
            case maxTipAmount = "max_tip_amount"
            case suggestedTipAmounts = "suggested_tip_amounts"
            case startParameter = "start_parameter"
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
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, title: String, description: String, payload: String, providerToken: String, currency: String, prices: [TGLabeledPrice], maxTipAmount: Int? = nil, suggestedTipAmounts: [Int]? = nil, startParameter: String? = nil, providerData: String? = nil, photoUrl: String? = nil, photoSize: Int? = nil, photoWidth: Int? = nil, photoHeight: Int? = nil, needName: Bool? = nil, needPhoneNumber: Bool? = nil, needEmail: Bool? = nil, needShippingAddress: Bool? = nil, sendPhoneNumberToProvider: Bool? = nil, sendEmailToProvider: Bool? = nil, isFlexible: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.title = title
            self.description = description
            self.payload = payload
            self.providerToken = providerToken
            self.currency = currency
            self.prices = prices
            self.maxTipAmount = maxTipAmount
            self.suggestedTipAmounts = suggestedTipAmounts
            self.startParameter = startParameter
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
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send invoices. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendInvoiceParams](https://core.telegram.org/bots/api#sendinvoice)
 
 - Parameters:
     - params: Parameters container, see `SendInvoiceParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `TGMessage` type
 */
    @discardableResult
    func sendInvoice(params: TGSendInvoiceParams) throws -> EventLoopFuture<TGMessage> {
        let methodURL: URI = .init(string: getMethodURL("sendInvoice"))
        let future: EventLoopFuture<TGMessage> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
