// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about an incoming shipping query.

 SeeAlso Telegram Bot API Reference:
 [ShippingQuery](https://core.telegram.org/bots/api#shippingquery)
 **/
public final class TGShippingQuery: Codable, Sendable {

    /// Custom keys for coding/decoding `ShippingQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case from = "from"
        case invoicePayload = "invoice_payload"
        case shippingAddress = "shipping_address"
    }

    /// Unique query identifier
    public let id: String

    /// User who sent the query
    public let from: TGUser

    /// Bot-specified invoice payload
    public let invoicePayload: String

    /// User specified shipping address
    public let shippingAddress: TGShippingAddress

    public init (id: String, from: TGUser, invoicePayload: String, shippingAddress: TGShippingAddress) {
        self.id = id
        self.from = from
        self.invoicePayload = invoicePayload
        self.shippingAddress = shippingAddress
    }
}
