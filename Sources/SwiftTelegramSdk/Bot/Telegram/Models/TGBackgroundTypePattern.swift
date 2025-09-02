// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a .PNG or .TGV (gzipped subset of SVG with MIME type “application/x-tgwallpattern”) pattern to be combined with the background fill chosen by the user.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypePattern](https://core.telegram.org/bots/api#backgroundtypepattern)
 **/
public final class TGBackgroundTypePattern: Codable, Sendable {

    /// Custom keys for coding/decoding `BackgroundTypePattern` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case document = "document"
        case fill = "fill"
        case intensity = "intensity"
        case isInverted = "is_inverted"
        case isMoving = "is_moving"
    }

    /// Type of the background, always “pattern”
    public let type: TGBackgroundTypePatternType

    /// Document with the pattern
    public let document: TGDocument

    /// The background fill that is combined with the pattern
    public let fill: TGBackgroundFill

    /// Intensity of the pattern when it is shown above the filled background; 0-100
    public let intensity: Int

    /// Optional. True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
    public let isInverted: Bool?

    /// Optional. True, if the background moves slightly when the device is tilted
    public let isMoving: Bool?

    public init (type: TGBackgroundTypePatternType, document: TGDocument, fill: TGBackgroundFill, intensity: Int, isInverted: Bool? = nil, isMoving: Bool? = nil) {
        self.type = type
        self.document = document
        self.fill = fill
        self.intensity = intensity
        self.isInverted = isInverted
        self.isMoving = isMoving
    }
}
