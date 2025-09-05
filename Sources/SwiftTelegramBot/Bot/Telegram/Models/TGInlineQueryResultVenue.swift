// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVenue](https://core.telegram.org/bots/api#inlinequeryresultvenue)
 **/
public final class TGInlineQueryResultVenue: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineQueryResultVenue` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case latitude = "latitude"
        case longitude = "longitude"
        case title = "title"
        case address = "address"
        case foursquareId = "foursquare_id"
        case foursquareType = "foursquare_type"
        case googlePlaceId = "google_place_id"
        case googlePlaceType = "google_place_type"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
        case thumbnailUrl = "thumbnail_url"
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
    }

    /// Type of the result, must be venue
    public let type: TGInlineQueryResultVenueType

    /// Unique identifier for this result, 1-64 Bytes
    public let id: String

    /// Latitude of the venue location in degrees
    public let latitude: Float

    /// Longitude of the venue location in degrees
    public let longitude: Float

    /// Title of the venue
    public let title: String

    /// Address of the venue
    public let address: String

    /// Optional. Foursquare identifier of the venue if known
    public let foursquareId: String?

    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    public let foursquareType: String?

    /// Optional. Google Places identifier of the venue
    public let googlePlaceId: String?

    /// Optional. Google Places type of the venue. (See supported types.)
    public let googlePlaceType: String?

    /// Optional. Inline keyboard attached to the message
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the venue
    public let inputMessageContent: TGInputMessageContent?

    /// Optional. Url of the thumbnail for the result
    public let thumbnailUrl: String?

    /// Optional. Thumbnail width
    public let thumbnailWidth: Int?

    /// Optional. Thumbnail height
    public let thumbnailHeight: Int?

    public init (type: TGInlineQueryResultVenueType, id: String, latitude: Float, longitude: Float, title: String, address: String, foursquareId: String? = nil, foursquareType: String? = nil, googlePlaceId: String? = nil, googlePlaceType: String? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil, inputMessageContent: TGInputMessageContent? = nil, thumbnailUrl: String? = nil, thumbnailWidth: Int? = nil, thumbnailHeight: Int? = nil) {
        self.type = type
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.address = address
        self.foursquareId = foursquareId
        self.foursquareType = foursquareType
        self.googlePlaceId = googlePlaceId
        self.googlePlaceType = googlePlaceType
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailWidth = thumbnailWidth
        self.thumbnailHeight = thumbnailHeight
    }
}
