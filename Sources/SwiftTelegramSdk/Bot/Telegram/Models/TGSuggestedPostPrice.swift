// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the price of a suggested post.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostPrice](https://core.telegram.org/bots/api#suggestedpostprice)
 **/
public final class TGSuggestedPostPrice: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostPrice` struct
    public enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case amount = "amount"
    }

    /// Currency in which the post will be paid. Currently, must be one of “XTR” for Telegram Stars or “TON” for toncoins
    public let currency: String

    /// The amount of the currency that will be paid for the post in the smallest units of the currency, i.e. Telegram Stars or nanotoncoins. Currently, price in Telegram Stars must be between 5 and 100000, and price in nanotoncoins must be between 10000000 and 10000000000000.
    public let amount: Int

    public init (currency: String, amount: Int) {
        self.currency = currency
        self.amount = amount
    }
}
