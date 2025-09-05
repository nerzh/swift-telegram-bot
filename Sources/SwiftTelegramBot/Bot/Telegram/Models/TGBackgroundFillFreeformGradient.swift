// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a freeform gradient that rotates after every message in the chat.

 SeeAlso Telegram Bot API Reference:
 [BackgroundFillFreeformGradient](https://core.telegram.org/bots/api#backgroundfillfreeformgradient)
 **/
public final class TGBackgroundFillFreeformGradient: Codable, Sendable {

    /// Custom keys for coding/decoding `BackgroundFillFreeformGradient` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case colors = "colors"
    }

    /// Type of the background fill, always “freeform_gradient”
    public let type: TGBackgroundFillFreeformGradientType

    /// A list of the 3 or 4 base colors that are used to generate the freeform gradient in the RGB24 format
    public let colors: [Int]

    public init (type: TGBackgroundFillFreeformGradientType, colors: [Int]) {
        self.type = type
        self.colors = colors
    }
}
