// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents one button of an inline keyboard. Exactly one of the optional fields must be used to specify type of the button.

 SeeAlso Telegram Bot API Reference:
 [InlineKeyboardButton](https://core.telegram.org/bots/api#inlinekeyboardbutton)
 **/
public final class TGInlineKeyboardButton: Codable, Sendable {

    /// Custom keys for coding/decoding `InlineKeyboardButton` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case url = "url"
        case callbackData = "callback_data"
        case webApp = "web_app"
        case loginUrl = "login_url"
        case switchInlineQuery = "switch_inline_query"
        case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
        case switchInlineQueryChosenChat = "switch_inline_query_chosen_chat"
        case copyText = "copy_text"
        case callbackGame = "callback_game"
        case pay = "pay"
    }

    /// Label text on the button
    public let text: String

    /// Optional. HTTP or tg:// URL to be opened when the button is pressed. Links tg://user?id=<user_id> can be used to mention a user by their identifier without using a username, if this is allowed by their privacy settings.
    public let url: String?

    /// Optional. Data to be sent in a callback query to the bot when the button is pressed, 1-64 bytes
    public let callbackData: String?

    /// Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot. Not supported for messages sent on behalf of a Telegram Business account.
    public let webApp: TGWebAppInfo?

    /// Optional. An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.
    public let loginUrl: TGLoginUrl?

    /// Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted. Not supported for messages sent in channel direct messages chats and on behalf of a Telegram Business account.
    public let switchInlineQuery: String?

    /// Optional. If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted.
    /// 
    /// This offers a quick way for the user to open your bot in inline mode in the same chat - good for selecting something from multiple options. Not supported in channels and for messages sent in channel direct messages chats and on behalf of a Telegram Business account.
    public let switchInlineQueryCurrentChat: String?

    /// Optional. If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field. Not supported for messages sent in channel direct messages chats and on behalf of a Telegram Business account.
    public let switchInlineQueryChosenChat: TGSwitchInlineQueryChosenChat?

    /// Optional. Description of the button that copies the specified text to the clipboard.
    public let copyText: TGCopyTextButton?

    /// Optional. Description of the game that will be launched when the user presses the button.
    /// 
    /// NOTE: This type of button must always be the first button in the first row.
    public let callbackGame: TGCallbackGame?

    /// Optional. Specify True, to send a Pay button. Substrings “” and “XTR” in the buttons's text will be replaced with a Telegram Star icon.
    /// 
    /// NOTE: This type of button must always be the first button in the first row and can only be used in invoice messages.
    public let pay: Bool?

    public init (text: String, url: String? = nil, callbackData: String? = nil, webApp: TGWebAppInfo? = nil, loginUrl: TGLoginUrl? = nil, switchInlineQuery: String? = nil, switchInlineQueryCurrentChat: String? = nil, switchInlineQueryChosenChat: TGSwitchInlineQueryChosenChat? = nil, copyText: TGCopyTextButton? = nil, callbackGame: TGCallbackGame? = nil, pay: Bool? = nil) {
        self.text = text
        self.url = url
        self.callbackData = callbackData
        self.webApp = webApp
        self.loginUrl = loginUrl
        self.switchInlineQuery = switchInlineQuery
        self.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
        self.switchInlineQueryChosenChat = switchInlineQueryChosenChat
        self.copyText = copyText
        self.callbackGame = callbackGame
        self.pay = pay
    }
}
