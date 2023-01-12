// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a point on the map.

 SeeAlso Telegram Bot API Reference:
 [Location](https://core.telegram.org/bots/api#location)
 */
public final class TGLocation: Codable {

    /// Custom keys for coding/decoding `Location` struct
    public enum CodingKeys: String, CodingKey {
        case longitude = "longitude"
        case latitude = "latitude"
        case horizontalAccuracy = "horizontal_accuracy"
        case livePeriod = "live_period"
        case heading = "heading"
        case proximityAlertRadius = "proximity_alert_radius"
    }

    /// Longitude as defined by sender
    public var longitude: Float

    /// Latitude as defined by sender
    public var latitude: Float

    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    public var horizontalAccuracy: Float?

    /// Optional. Time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only.
    public var livePeriod: Int?

    /// Optional. The direction in which user is moving, in degrees; 1-360. For active live locations only.
    public var heading: Int?

    /// Optional. The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only.
    public var proximityAlertRadius: Int?

    public init (longitude: Float, latitude: Float, horizontalAccuracy: Float? = nil, livePeriod: Int? = nil, heading: Int? = nil, proximityAlertRadius: Int? = nil) {
        self.longitude = longitude
        self.latitude = latitude
        self.horizontalAccuracy = horizontalAccuracy
        self.livePeriod = livePeriod
        self.heading = heading
        self.proximityAlertRadius = proximityAlertRadius
    }
}
