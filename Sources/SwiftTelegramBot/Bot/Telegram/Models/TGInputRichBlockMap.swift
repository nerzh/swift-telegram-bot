// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a map, corresponding to the custom HTML tag <tg-map>. The map's width and height must not exceed 10000 in total. The width and height ratio must be at most 20.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockMap](https://core.telegram.org/bots/api#inputrichblockmap)
 **/
public final class TGInputRichBlockMap: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockMap` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case location = "location"
        case zoom = "zoom"
        case width = "width"
        case height = "height"
        case caption = "caption"
    }

    /// Type of the block, always “map”
    public let type: TGInputRichBlockMapType

    /// Location of the center of the map
    public let location: TGLocation

    /// Map zoom level; 0-24
    public let zoom: Int

    /// Map width; 0-10000
    public let width: Int

    /// Map height; 0-10000
    public let height: Int

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockMapType, location: TGLocation, zoom: Int, width: Int, height: Int, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.location = location
        self.zoom = zoom
        self.width = width
        self.height = height
        self.caption = caption
    }
}
