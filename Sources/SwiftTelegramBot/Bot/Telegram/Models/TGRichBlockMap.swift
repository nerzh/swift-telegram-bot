// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a map, corresponding to the custom HTML tag <tg-map>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockMap](https://core.telegram.org/bots/api#richblockmap)
 **/
public final class TGRichBlockMap: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockMap` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case location = "location"
        case zoom = "zoom"
        case width = "width"
        case height = "height"
        case caption = "caption"
    }

    /// Type of the block, always “map”
    public let type: TGRichBlockMapType

    /// Location of the center of the map
    public let location: TGLocation

    /// Map zoom level; 13-20
    public let zoom: Int

    /// Expected width of the map
    public let width: Int

    /// Expected height of the map
    public let height: Int

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockMapType, location: TGLocation, zoom: Int, width: Int, height: Int, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.location = location
        self.zoom = zoom
        self.width = width
        self.height = height
        self.caption = caption
    }
}
