// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents one button of an inline keyboard. You must use exactly one of the optional fields.

 SeeAlso Telegram Bot API Reference:
 [InlineKeyboardButton](https://core.telegram.org/bots/api#inlinekeyboardbutton)
 */
public final class TGInlineKeyboardButton: Codable {

    /// Custom keys for coding/decoding `InlineKeyboardButton` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case url = "url"
        case callbackData = "callback_data"
        case webApp = "web_app"
        case loginUrl = "login_url"
        case switchInlineQuery = "switch_inline_query"
        case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
        case callbackGame = "callback_game"
        case pay = "pay"
    }

    /// Label text on the button
    public var text: String

    /// Optional. HTTP or tg:// URL to be opened when the button is pressed. Links tg://user?id=<user_id> can be used to mention a user by their ID without using a username, if this is allowed by their privacy settings.
    public var url: String?

    /// Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
    public var callbackData: String?

    /// Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot.
    public var webApp: TGWebAppInfo?

    /// Optional. An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.
    public var loginUrl: TGLoginUrl?

    /// Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted.
    /// 
    /// Note: This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with switch_pm… actions - in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.
    public var switchInlineQuery: String?

    /// Optional. If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted.
    /// 
    /// This offers a quick way for the user to open your bot in inline mode in the same chat - good for selecting something from multiple options.
    public var switchInlineQueryCurrentChat: String?

    /// Optional. Description of the game that will be launched when the user presses the button.
    /// 
    /// NOTE: This type of button must always be the first button in the first row.
    public var callbackGame: TGCallbackGame?

    /// Optional. Specify True, to send a Pay button.
    /// 
    /// NOTE: This type of button must always be the first button in the first row and can only be used in invoice messages.
    public var pay: Bool?

    public init (text: String, url: String? = nil, callbackData: String? = nil, webApp: TGWebAppInfo? = nil, loginUrl: TGLoginUrl? = nil, switchInlineQuery: String? = nil, switchInlineQueryCurrentChat: String? = nil, callbackGame: TGCallbackGame? = nil, pay: Bool? = nil) {
        self.text = text
        self.url = url
        self.callbackData = callbackData
        self.webApp = webApp
        self.loginUrl = loginUrl
        self.switchInlineQuery = switchInlineQuery
        self.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
        self.callbackGame = callbackGame
        self.pay = pay
    }
}
