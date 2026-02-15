// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents one button of the reply keyboard. At most one of the fields other than text, icon_custom_emoji_id, and style must be used to specify the type of the button. For simple text buttons, String can be used instead of this object to specify the button text.

 SeeAlso Telegram Bot API Reference:
 [KeyboardButton](https://core.telegram.org/bots/api#keyboardbutton)
 **/
public final class TGKeyboardButton: Codable, Sendable {

    /// Custom keys for coding/decoding `KeyboardButton` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case iconCustomEmojiId = "icon_custom_emoji_id"
        case style = "style"
        case requestUsers = "request_users"
        case requestChat = "request_chat"
        case requestContact = "request_contact"
        case requestLocation = "request_location"
        case requestPoll = "request_poll"
        case webApp = "web_app"
    }

    /// Text of the button. If none of the fields other than text, icon_custom_emoji_id, and style are used, it will be sent as a message when the button is pressed
    public let text: String

    /// Optional. Unique identifier of the custom emoji shown before the text of the button. Can only be used by bots that purchased additional usernames on Fragment or in the messages directly sent by the bot to private, group and supergroup chats if the owner of the bot has a Telegram Premium subscription.
    public let iconCustomEmojiId: String?

    /// Optional. Style of the button. Must be one of “danger” (red), “success” (green) or “primary” (blue). If omitted, then an app-specific style is used.
    public let style: String?

    /// Optional. If specified, pressing the button will open a list of suitable users. Identifiers of selected users will be sent to the bot in a “users_shared” service message. Available in private chats only.
    public let requestUsers: TGKeyboardButtonRequestUsers?

    /// Optional. If specified, pressing the button will open a list of suitable chats. Tapping on a chat will send its identifier to the bot in a “chat_shared” service message. Available in private chats only.
    public let requestChat: TGKeyboardButtonRequestChat?

    /// Optional. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only.
    public let requestContact: Bool?

    /// Optional. If True, the user's current location will be sent when the button is pressed. Available in private chats only.
    public let requestLocation: Bool?

    /// Optional. If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only.
    public let requestPoll: TGKeyboardButtonPollType?

    /// Optional. If specified, the described Web App will be launched when the button is pressed. The Web App will be able to send a “web_app_data” service message. Available in private chats only.
    public let webApp: TGWebAppInfo?

    public init (text: String, iconCustomEmojiId: String? = nil, style: String? = nil, requestUsers: TGKeyboardButtonRequestUsers? = nil, requestChat: TGKeyboardButtonRequestChat? = nil, requestContact: Bool? = nil, requestLocation: Bool? = nil, requestPoll: TGKeyboardButtonPollType? = nil, webApp: TGWebAppInfo? = nil) {
        self.text = text
        self.iconCustomEmojiId = iconCustomEmojiId
        self.style = style
        self.requestUsers = requestUsers
        self.requestChat = requestChat
        self.requestContact = requestContact
        self.requestLocation = requestLocation
        self.requestPoll = requestPoll
        self.webApp = webApp
    }
}
