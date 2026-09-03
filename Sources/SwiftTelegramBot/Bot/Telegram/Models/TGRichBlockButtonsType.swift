// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block containing a list of buttons that are shown in one row, corresponding to the custom HTML tag <tg-button-row>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockButtons](https://core.telegram.org/bots/api#richblockbuttons)
 */

public enum TGRichBlockButtonsType: String, Codable, Sendable {
    case buttons = "buttons"
}