// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a venue to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaVenue](https://core.telegram.org/bots/api#inputmediavenue)
 **/
public final class TGInputMediaVenue: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaVenue` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case latitude = "latitude"
        case longitude = "longitude"
        case title = "title"
        case address = "address"
        case foursquareId = "foursquare_id"
        case foursquareType = "foursquare_type"
        case googlePlaceId = "google_place_id"
        case googlePlaceType = "google_place_type"
    }

    /// Type of the media, must be venue
    public let type: TGInputMediaVenueType

    /// Latitude of the location
    public let latitude: Float

    /// Longitude of the location
    public let longitude: Float

    /// Name of the venue
    public let title: String

    /// Address of the venue
    public let address: String

    /// Optional. Foursquare identifier of the venue
    public let foursquareId: String?

    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    public let foursquareType: String?

    /// Optional. Google Places identifier of the venue
    public let googlePlaceId: String?

    /// Optional. Google Places type of the venue. (See supported types.)
    public let googlePlaceType: String?

    public init (type: TGInputMediaVenueType, latitude: Float, longitude: Float, title: String, address: String, foursquareId: String? = nil, foursquareType: String? = nil, googlePlaceId: String? = nil, googlePlaceType: String? = nil) {
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.address = address
        self.foursquareId = foursquareId
        self.foursquareType = foursquareType
        self.googlePlaceId = googlePlaceId
        self.googlePlaceType = googlePlaceType
    }
}
