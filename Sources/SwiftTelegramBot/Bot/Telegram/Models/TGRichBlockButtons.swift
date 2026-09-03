// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag <tg-button-row>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockButtons](https://core.telegram.org/bots/api#richblockbuttons)
 **/
public final class TGRichBlockButtons: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockButtons` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case buttons = "buttons"
        case align = "align"
    }

    /// Type of the block, always “buttons”
    public let type: TGRichBlockButtonsType

    /// The buttons
    public let buttons: [TGRichMessageButton]

    /// Optional. Horizontal alignment of the buttons. Currently, must be one of “left”, “center”, or “right”.
    public let align: String?

    public init (type: TGRichBlockButtonsType, buttons: [TGRichMessageButton], align: String? = nil) {
        self.type = type
        self.buttons = buttons
        self.align = align
    }
}
