// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents information about an order.

 SeeAlso Telegram Bot API Reference:
 [OrderInfo](https://core.telegram.org/bots/api#orderinfo)
 **/
public final class TGOrderInfo: Codable, Sendable {

    /// Custom keys for coding/decoding `OrderInfo` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case phoneNumber = "phone_number"
        case email = "email"
        case shippingAddress = "shipping_address"
    }

    /// Optional. User name
    public let name: String?

    /// Optional. User's phone number
    public let phoneNumber: String?

    /// Optional. User email
    public let email: String?

    /// Optional. User shipping address
    public let shippingAddress: TGShippingAddress?

    public init (name: String? = nil, phoneNumber: String? = nil, email: String? = nil, shippingAddress: TGShippingAddress? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.shippingAddress = shippingAddress
    }
}
