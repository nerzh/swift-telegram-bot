// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a gradient fill.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillGradient](https://core.telegram.org/bots/api#backgroundfillgradient)
 **/
public final class TGBackgroundFillGradient: Codable, Sendable {

    /// Custom keys for coding/decoding `BackgroundFillGradient` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case topColor = "top_color"
        case bottomColor = "bottom_color"
        case rotationAngle = "rotation_angle"
    }

    /// Type of the background fill, always “gradient”
    public let type: TGBackgroundFillGradientType

    /// Top color of the gradient in the RGB24 format
    public let topColor: Int

    /// Bottom color of the gradient in the RGB24 format
    public let bottomColor: Int

    /// Clockwise rotation angle of the background fill in degrees; 0-359
    public let rotationAngle: Int

    public init (type: TGBackgroundFillGradientType, topColor: Int, bottomColor: Int, rotationAngle: Int) {
        self.type = type
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.rotationAngle = rotationAngle
    }
}
