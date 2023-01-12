// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a shipping address.

 SeeAlso Telegram Bot API Reference:
 [ShippingAddress](https://core.telegram.org/bots/api#shippingaddress)
 */
public final class TGShippingAddress: Codable {

    /// Custom keys for coding/decoding `ShippingAddress` struct
    public enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case state = "state"
        case city = "city"
        case streetLine1 = "street_line1"
        case streetLine2 = "street_line2"
        case postCode = "post_code"
    }

    /// Two-letter ISO 3166-1 alpha-2 country code
    public var countryCode: String

    /// State, if applicable
    public var state: String

    /// City
    public var city: String

    /// First line for the address
    public var streetLine1: String

    /// Second line for the address
    public var streetLine2: String

    /// Address post code
    public var postCode: String

    public init (countryCode: String, state: String, city: String, streetLine1: String, streetLine2: String, postCode: String) {
        self.countryCode = countryCode
        self.state = state
        self.city = city
        self.streetLine1 = streetLine1
        self.streetLine2 = streetLine2
        self.postCode = postCode
    }
}
