// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a venue.

 SeeAlso Telegram Bot API Reference:
 [Venue](https://core.telegram.org/bots/api#venue)
 */
public final class TGVenue: Codable {

    /// Custom keys for coding/decoding `Venue` struct
    public enum CodingKeys: String, CodingKey {
        case location = "location"
        case title = "title"
        case address = "address"
        case foursquareId = "foursquare_id"
        case foursquareType = "foursquare_type"
        case googlePlaceId = "google_place_id"
        case googlePlaceType = "google_place_type"
    }

    /// Venue location. Can't be a live location
    public var location: TGLocation

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Optional. Foursquare identifier of the venue
    public var foursquareId: String?

    /// Optional. Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    public var foursquareType: String?

    /// Optional. Google Places identifier of the venue
    public var googlePlaceId: String?

    /// Optional. Google Places type of the venue. (See supported types.)
    public var googlePlaceType: String?

    public init (location: TGLocation, title: String, address: String, foursquareId: String? = nil, foursquareType: String? = nil, googlePlaceId: String? = nil, googlePlaceType: String? = nil) {
        self.location = location
        self.title = title
        self.address = address
        self.foursquareId = foursquareId
        self.foursquareType = foursquareType
        self.googlePlaceId = googlePlaceId
        self.googlePlaceType = googlePlaceType
    }
}
