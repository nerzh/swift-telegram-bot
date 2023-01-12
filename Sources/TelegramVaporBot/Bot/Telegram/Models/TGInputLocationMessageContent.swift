// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents the content of a location message to be sent as the result of an inline query.

 SeeAlso Telegram Bot API Reference:
 [InputLocationMessageContent](https://core.telegram.org/bots/api#inputlocationmessagecontent)
 */
public final class TGInputLocationMessageContent: Codable {

    /// Custom keys for coding/decoding `InputLocationMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case horizontalAccuracy = "horizontal_accuracy"
        case livePeriod = "live_period"
        case heading = "heading"
        case proximityAlertRadius = "proximity_alert_radius"
    }

    /// Latitude of the location in degrees
    public var latitude: Float

    /// Longitude of the location in degrees
    public var longitude: Float

    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    public var horizontalAccuracy: Float?

    /// Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
    public var livePeriod: Int?

    /// Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    public var heading: Int?

    /// Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    public var proximityAlertRadius: Int?

    public init (latitude: Float, longitude: Float, horizontalAccuracy: Float? = nil, livePeriod: Int? = nil, heading: Int? = nil, proximityAlertRadius: Int? = nil) {
        self.latitude = latitude
        self.longitude = longitude
        self.horizontalAccuracy = horizontalAccuracy
        self.livePeriod = livePeriod
        self.heading = heading
        self.proximityAlertRadius = proximityAlertRadius
    }
}
