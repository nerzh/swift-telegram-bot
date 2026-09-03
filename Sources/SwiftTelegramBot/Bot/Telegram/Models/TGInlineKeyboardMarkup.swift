// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an inline keyboard that appears right next to the message it belongs to.

 SeeAlso Telegram Bot API Reference:
 [InlineKeyboardMarkup](https://core.telegram.org/bots/api#inlinekeyboardmarkup)
 **/
public final class TGInlineKeyboardMarkup: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineKeyboardMarkup` struct
    public enum CodingKeys: String, CodingKey {
        case inlineKeyboard = "inline_keyboard"
        case forceReply = "force_reply"
    }

    /// Array of button rows, each represented by an Array of InlineKeyboardButton objects
    public let inlineKeyboard: [[TGInlineKeyboardButton]]

    /// Optional. Pass True if the reply interface must be shown to the user, as if they had manually selected the bot's message and tapped 'Reply'. The value of the field can't be changed when the inline keyboard is edited.
    public let forceReply: Bool?

    public init (inlineKeyboard: [[TGInlineKeyboardButton]], forceReply: Bool? = nil) {
        self.inlineKeyboard = inlineKeyboard
        self.forceReply = forceReply
    }
}
