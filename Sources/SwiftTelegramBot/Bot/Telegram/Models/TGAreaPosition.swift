// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the position of a rectangle area on a story media or a TON wallet card.

 SeeAlso Telegram Bot API Reference:
 [AreaPosition](https://core.telegram.org/bots/api#areaposition)
 **/
public final class TGAreaPosition: Codable, Sendable {

    /// Custom keys for coding/decoding `AreaPosition` struct
    public enum CodingKeys: String, CodingKey {
        case xPercentage = "x_percentage"
        case yPercentage = "y_percentage"
        case widthPercentage = "width_percentage"
        case heightPercentage = "height_percentage"
        case rotationAngle = "rotation_angle"
        case cornerRadiusPercentage = "corner_radius_percentage"
    }

    /// The abscissa of the area's center, as a percentage of the media or the card width
    public let xPercentage: Float

    /// The ordinate of the area's center, as a percentage of the media or the card height
    public let yPercentage: Float

    /// The width of the area's rectangle, as a percentage of the media or the card width
    public let widthPercentage: Float

    /// The height of the area's rectangle, as a percentage of the media or the card height
    public let heightPercentage: Float

    /// The clockwise rotation angle of the rectangle, in degrees; 0-360
    public let rotationAngle: Float

    /// The radius of the rectangle corner rounding, as a percentage of the media or the card width
    public let cornerRadiusPercentage: Float

    public init (xPercentage: Float, yPercentage: Float, widthPercentage: Float, heightPercentage: Float, rotationAngle: Float, cornerRadiusPercentage: Float) {
        self.xPercentage = xPercentage
        self.yPercentage = yPercentage
        self.widthPercentage = widthPercentage
        self.heightPercentage = heightPercentage
        self.rotationAngle = rotationAngle
        self.cornerRadiusPercentage = cornerRadiusPercentage
    }
}
