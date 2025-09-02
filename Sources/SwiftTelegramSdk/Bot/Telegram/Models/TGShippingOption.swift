// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents one shipping option.

 SeeAlso Telegram Bot API Reference:
 [ShippingOption](https://core.telegram.org/bots/api#shippingoption)
 **/
public final class TGShippingOption: Codable, Sendable {

    /// Custom keys for coding/decoding `ShippingOption` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case prices = "prices"
    }

    /// Shipping option identifier
    public let id: String

    /// Option title
    public let title: String

    /// List of price portions
    public let prices: [TGLabeledPrice]

    public init (id: String, title: String, prices: [TGLabeledPrice]) {
        self.id = id
        self.title = title
        self.prices = prices
    }
}
