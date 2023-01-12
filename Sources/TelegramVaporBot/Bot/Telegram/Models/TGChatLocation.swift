// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a location to which a chat is connected.

 SeeAlso Telegram Bot API Reference:
 [ChatLocation](https://core.telegram.org/bots/api#chatlocation)
 */
public final class TGChatLocation: Codable {

    /// Custom keys for coding/decoding `ChatLocation` struct
    public enum CodingKeys: String, CodingKey {
        case location = "location"
        case address = "address"
    }

    /// The location to which the supergroup is connected. Can't be a live location.
    public var location: TGLocation

    /// Location address; 1-64 characters, as defined by the chat owner
    public var address: String

    public init (location: TGLocation, address: String) {
        self.location = location
        self.address = address
    }
}
