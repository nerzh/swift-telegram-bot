// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag <tg-button-row>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockButtons](https://core.telegram.org/bots/api#inputrichblockbuttons)
 **/
public final class TGInputRichBlockButtons: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockButtons` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case buttons = "buttons"
        case align = "align"
    }

    /// Type of the block, always “buttons”
    public let type: TGInputRichBlockButtonsType

    /// List of 1-8 buttons to send
    public let buttons: [TGRichMessageButton]

    /// Optional. Horizontal alignment of the buttons. Currently, must be one of “left”, “center”, or “right”.
    public let align: String?

    public init (type: TGInputRichBlockButtonsType, buttons: [TGRichMessageButton], align: String? = nil) {
        self.type = type
        self.buttons = buttons
        self.align = align
    }
}
