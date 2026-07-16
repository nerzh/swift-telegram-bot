// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a location to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaLocation](https://core.telegram.org/bots/api#inputmedialocation)
 **/
public final class TGInputMediaLocation: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaLocation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case latitude = "latitude"
        case longitude = "longitude"
        case horizontalAccuracy = "horizontal_accuracy"
    }

    /// Type of the media, must be location
    public let type: TGInputMediaLocationType

    /// Latitude of the location
    public let latitude: Float

    /// Longitude of the location
    public let longitude: Float

    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    public let horizontalAccuracy: Float?

    public init (type: TGInputMediaLocationType, latitude: Float, longitude: Float, horizontalAccuracy: Float? = nil) {
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
        self.horizontalAccuracy = horizontalAccuracy
    }
}
