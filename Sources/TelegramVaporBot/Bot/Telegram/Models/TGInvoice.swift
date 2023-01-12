// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object contains basic information about an invoice.

 SeeAlso Telegram Bot API Reference:
 [Invoice](https://core.telegram.org/bots/api#invoice)
 */
public final class TGInvoice: Codable {

    /// Custom keys for coding/decoding `Invoice` struct
    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case startParameter = "start_parameter"
        case currency = "currency"
        case totalAmount = "total_amount"
    }

    /// Product name
    public var title: String

    /// Product description
    public var description: String

    /// Unique bot deep-linking parameter that can be used to generate this invoice
    public var startParameter: String

    /// Three-letter ISO 4217 currency code
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    public init (title: String, description: String, startParameter: String, currency: String, totalAmount: Int) {
        self.title = title
        self.description = description
        self.startParameter = startParameter
        self.currency = currency
        self.totalAmount = totalAmount
    }
}
