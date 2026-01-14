// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the background of a gift.

 SeeAlso Telegram Bot API Reference:
 [GiftBackground](https://core.telegram.org/bots/api#giftbackground)
 **/
public final class TGGiftBackground: Codable, Sendable {

    /// Custom keys for coding/decoding `GiftBackground` struct
    public enum CodingKeys: String, CodingKey {
        case centerColor = "center_color"
        case edgeColor = "edge_color"
        case textColor = "text_color"
    }

    /// Center color of the background in RGB format
    public let centerColor: Int

    /// Edge color of the background in RGB format
    public let edgeColor: Int

    /// Text color of the background in RGB format
    public let textColor: Int

    public init (centerColor: Int, edgeColor: Int, textColor: Int) {
        self.centerColor = centerColor
        self.edgeColor = edgeColor
        self.textColor = textColor
    }
}
