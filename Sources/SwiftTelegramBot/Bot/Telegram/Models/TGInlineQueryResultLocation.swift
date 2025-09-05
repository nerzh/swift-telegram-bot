// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultLocation](https://core.telegram.org/bots/api#inlinequeryresultlocation)
 **/
public final class TGInlineQueryResultLocation: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultLocation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case latitude = "latitude"
        case longitude = "longitude"
        case title = "title"
        case horizontalAccuracy = "horizontal_accuracy"
        case livePeriod = "live_period"
        case heading = "heading"
        case proximityAlertRadius = "proximity_alert_radius"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
        case thumbnailUrl = "thumbnail_url"
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }

    /// Type of the result, must be location
    public let type: TGInlineQueryResultLocationType

    /// Unique identifier for this result, 1-64 Bytes
    public let id: String

    /// Location latitude in degrees
    public let latitude: Float

    /// Location longitude in degrees
    public let longitude: Float

    /// Location title
    public let title: String

    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    public let horizontalAccuracy: Float?

    /// Optional. Period in seconds during which the location can be updated, should be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely.
    public let livePeriod: Int?

    /// Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    public let heading: Int?

    /// Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    public let proximityAlertRadius: Int?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the location
    public let inputMessageContent: TGInputMessageContent?

    /// Optional. Url of the thumbnail for the result
    public let thumbnailUrl: String?

    /// Optional. Thumbnail width
    public let thumbnailWidth: Int?

    /// Optional. Thumbnail height
    public let thumbnailHeight: Int?

    public init (type: TGInlineQueryResultLocationType, id: String, latitude: Float, longitude: Float, title: String, horizontalAccuracy: Float? = nil, livePeriod: Int? = nil, heading: Int? = nil, proximityAlertRadius: Int? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil, thumbnailUrl: String? = nil, thumbnailWidth: Int? = nil, thumbnailHeight: Int? = nil) {
        self.type = type
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.horizontalAccuracy = horizontalAccuracy
        self.livePeriod = livePeriod
        self.heading = heading
        self.proximityAlertRadius = proximityAlertRadius
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailWidth = thumbnailWidth
        self.thumbnailHeight = thumbnailHeight
    }
}
