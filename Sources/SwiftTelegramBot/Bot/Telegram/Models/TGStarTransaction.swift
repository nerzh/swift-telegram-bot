// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a Telegram Star transaction. Note that if the buyer initiates a chargeback with the payment provider from whom they acquired Stars (e.g., Apple, Google) following this transaction, the refunded Stars will be deducted from the bot's balance. This is outside of Telegram's control.

 SeeAlso Telegram Bot API Reference:
 [StarTransaction](https://core.telegram.org/bots/api#startransaction)
 **/
public final class TGStarTransaction: Codable, Sendable {

    /// Custom keys for coding/decoding `StarTransaction` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case amount = "amount"
        case nanostarAmount = "nanostar_amount"
        case date = "date"
        case source = "source"
        case receiver = "receiver"
    }

    /// Unique identifier of the transaction. Coincides with the identifier of the original transaction for refund transactions. Coincides with SuccessfulPayment.telegram_payment_charge_id for successful incoming payments from users.
    public let id: String

    /// Integer amount of Telegram Stars transferred by the transaction
    public let amount: Int

    /// Optional. The number of 1/1000000000 shares of Telegram Stars transferred by the transaction; from 0 to 999999999
    public let nanostarAmount: Int?

    /// Date the transaction was created in Unix time
    public let date: Int

    /// Optional. Source of an incoming transaction (e.g., a user purchasing goods or services, Fragment refunding a failed withdrawal). Only for incoming transactions
    public let source: TGTransactionPartner?

    /// Optional. Receiver of an outgoing transaction (e.g., a user for a purchase refund, Fragment for a withdrawal). Only for outgoing transactions
    public let receiver: TGTransactionPartner?

    public init (id: String, amount: Int, nanostarAmount: Int? = nil, date: Int, source: TGTransactionPartner? = nil, receiver: TGTransactionPartner? = nil) {
        self.id = id
        self.amount = amount
        self.nanostarAmount = nanostarAmount
        self.date = date
        self.source = source
        self.receiver = receiver
    }
}
