// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Contains information about the location of a Telegram Business account.

 SeeAlso Telegram Bot API Reference:
 [BusinessLocation](https://core.telegram.org/bots/api#businesslocation)
 **/
public final class TGBusinessLocation: Codable, Sendable {

    /// Custom keys for coding/decoding `BusinessLocation` struct
    public enum CodingKeys: String, CodingKey {
        case address = "address"
        case location = "location"
    }

    /// Address of the business
    public let address: String

    /// Optional. Location of the business
    public let location: TGLocation?

    public init (address: String, location: TGLocation? = nil) {
        self.address = address
        self.location = location
    }
}
