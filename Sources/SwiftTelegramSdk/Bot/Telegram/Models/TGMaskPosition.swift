// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the position on faces where a mask should be placed by default.

 SeeAlso Telegram Bot API Reference:
 [MaskPosition](https://core.telegram.org/bots/api#maskposition)
 **/
public final class TGMaskPosition: Codable, Sendable {

    /// Custom keys for coding/decoding `MaskPosition` struct
    public enum CodingKeys: String, CodingKey {
        case point = "point"
        case xShift = "x_shift"
        case yShift = "y_shift"
        case scale = "scale"
    }

    /// The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    public let point: String

    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    public let xShift: Float

    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    public let yShift: Float

    /// Mask scaling coefficient. For example, 2.0 means double size.
    public let scale: Float

    public init (point: String, xShift: Float, yShift: Float, scale: Float) {
        self.point = point
        self.xShift = xShift
        self.yShift = yShift
        self.scale = scale
    }
}
