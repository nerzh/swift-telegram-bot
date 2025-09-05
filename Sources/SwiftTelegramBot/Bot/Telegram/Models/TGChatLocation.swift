// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a location to which a chat is connected.

 SeeAlso Telegram Bot API Reference:
 [ChatLocation](https://core.telegram.org/bots/api#chatlocation)
 **/
public final class TGChatLocation: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatLocation` struct
    public enum CodingKeys: String, CodingKey {
        case location = "location"
        case address = "address"
    }

    /// The location to which the supergroup is connected. Can't be a live location.
    public let location: TGLocation

    /// Location address; 1-64 characters, as defined by the chat owner
    public let address: String

    public init (location: TGLocation, address: String) {
        self.location = location
        self.address = address
    }
}
