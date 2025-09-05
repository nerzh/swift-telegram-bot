// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a successful payment for a suggested post.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostPaid](https://core.telegram.org/bots/api#suggestedpostpaid)
 **/
public final class TGSuggestedPostPaid: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostPaid` struct
    public enum CodingKeys: String, CodingKey {
        case suggestedPostMessage = "suggested_post_message"
        case currency = "currency"
        case amount = "amount"
        case starAmount = "star_amount"
    }

    /// Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let suggestedPostMessage: TGMessage?

    /// Currency in which the payment was made. Currently, one of “XTR” for Telegram Stars or “TON” for toncoins
    public let currency: String

    /// Optional. The amount of the currency that was received by the channel in nanotoncoins; for payments in toncoins only
    public let amount: Int?

    /// Optional. The amount of Telegram Stars that was received by the channel; for payments in Telegram Stars only
    public let starAmount: TGStarAmount?

    public init (suggestedPostMessage: TGMessage? = nil, currency: String, amount: Int? = nil, starAmount: TGStarAmount? = nil) {
        self.suggestedPostMessage = suggestedPostMessage
        self.currency = currency
        self.amount = amount
        self.starAmount = starAmount
    }
}
