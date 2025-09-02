// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send invoices. On success, the sent Message is returned.


/// Parameters container struct for `sendInvoice` method
public struct TGSendInvoiceParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public let messageThreadId: Int?

    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    public let directMessagesTopicId: Int?

    /// Product name, 1-32 characters
    public let title: String

    /// Product description, 1-255 characters
    public let description: String

    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use it for your internal processes.
    public let payload: String

    /// Payment provider token, obtained via @BotFather. Pass an empty string for payments in Telegram Stars.
    public let providerToken: String?

    /// Three-letter ISO 4217 currency code, see more on currencies. Pass “XTR” for payments in Telegram Stars.
    public let currency: String

    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.). Must contain exactly one item for payments in Telegram Stars.
    public let prices: [TGLabeledPrice]

    /// The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0. Not supported for payments in Telegram Stars.
    public let maxTipAmount: Int?

    /// A JSON-serialized array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
    public let suggestedTipAmounts: [Int]?

    /// Unique deep-linking parameter. If left empty, forwarded copies of the sent message will have a Pay button, allowing multiple users to pay directly from the forwarded message, using the same invoice. If non-empty, forwarded copies of the sent message will have a URL button with a deep link to the bot (instead of a Pay button), with the value used as the start parameter
    public let startParameter: String?

    /// JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    public let providerData: String?

    /// URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
    public let photoUrl: String?

    /// Photo size in bytes
    public let photoSize: Int?

    /// Photo width
    public let photoWidth: Int?

    /// Photo height
    public let photoHeight: Int?

    /// Pass True if you require the user's full name to complete the order. Ignored for payments in Telegram Stars.
    public let needName: Bool?

    /// Pass True if you require the user's phone number to complete the order. Ignored for payments in Telegram Stars.
    public let needPhoneNumber: Bool?

    /// Pass True if you require the user's email address to complete the order. Ignored for payments in Telegram Stars.
    public let needEmail: Bool?

    /// Pass True if you require the user's shipping address to complete the order. Ignored for payments in Telegram Stars.
    public let needShippingAddress: Bool?

    /// Pass True if the user's phone number should be sent to the provider. Ignored for payments in Telegram Stars.
    public let sendPhoneNumberToProvider: Bool?

    /// Pass True if the user's email address should be sent to the provider. Ignored for payments in Telegram Stars.
    public let sendEmailToProvider: Bool?

    /// Pass True if the final price depends on the shipping method. Ignored for payments in Telegram Stars.
    public let isFlexible: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public let protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance
    public let allowPaidBroadcast: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public let messageEffectId: String?

    /// A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    public let suggestedPostParameters: TGSuggestedPostParameters?

    /// Description of the message to reply to
    public let replyParameters: TGReplyParameters?

    /// A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `SendInvoiceParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case directMessagesTopicId = "direct_messages_topic_id"
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
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case suggestedPostParameters = "suggested_post_parameters"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, messageThreadId: Int? = nil, directMessagesTopicId: Int? = nil, title: String, description: String, payload: String, providerToken: String? = nil, currency: String, prices: [TGLabeledPrice], maxTipAmount: Int? = nil, suggestedTipAmounts: [Int]? = nil, startParameter: String? = nil, providerData: String? = nil, photoUrl: String? = nil, photoSize: Int? = nil, photoWidth: Int? = nil, photoHeight: Int? = nil, needName: Bool? = nil, needPhoneNumber: Bool? = nil, needEmail: Bool? = nil, needShippingAddress: Bool? = nil, sendPhoneNumberToProvider: Bool? = nil, sendEmailToProvider: Bool? = nil, isFlexible: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, suggestedPostParameters: TGSuggestedPostParameters? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.directMessagesTopicId = directMessagesTopicId
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
            self.allowPaidBroadcast = allowPaidBroadcast
            self.messageEffectId = messageEffectId
            self.suggestedPostParameters = suggestedPostParameters
            self.replyParameters = replyParameters
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
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendInvoice(params: TGSendInvoiceParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendInvoice")) else {
            throw BotError("Bad URL: \(getMethodURL("sendInvoice"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
