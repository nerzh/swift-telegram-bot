// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a button in a RichMessage. Exactly one of the fields other than text and style must be used to specify the type of the button.

 SeeAlso Telegram Bot API Reference:
 [RichMessageButton](https://core.telegram.org/bots/api#richmessagebutton)
 **/
public final class TGRichMessageButton: Codable, Sendable {

    /// Custom keys for coding/decoding `RichMessageButton` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case style = "style"
        case url = "url"
        case callbackData = "callback_data"
        case webApp = "web_app"
        case loginUrl = "login_url"
        case switchInlineQuery = "switch_inline_query"
        case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
        case switchInlineQueryChosenChat = "switch_inline_query_chosen_chat"
        case copyText = "copy_text"
        case disabled = "disabled"
    }

    /// Text of the button. May contain only plain text, RichTextCustomEmoji and RichTextDateTime entities.
    public let text: TGRichText

    /// Optional. Style of the button. Must be one of “danger”, “success”, “primary”, or “link” (the button is shown as a regular link without borders). Apps may use theme-specific colors for the button background and text based on the style. The style “link” is allowed only for callback buttons.
    public let style: String?

    /// Optional. HTTP or tg:// URL to be opened when the button is pressed. Links tg://user?id=<user_id> can be used to mention a user by their identifier without using a username, if this is allowed by their privacy settings.
    public let url: String?

    /// Optional. Data to be sent in a callback query to the bot when the button is pressed, 1-64 bytes
    public let callbackData: String?

    /// Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot. Not supported for messages sent on behalf of a business account.
    public let webApp: TGWebAppInfo?

    /// Optional. An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget. Not supported for ephemeral messages.
    public let loginUrl: TGLoginUrl?

    /// Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    public let switchInlineQuery: String?

    /// Optional. If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted. Not supported in channels and for messages sent in channel direct messages chats and on behalf of a business account.
    public let switchInlineQueryCurrentChat: String?

    /// Optional. If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field. Not supported for messages sent in channel direct messages chats and on behalf of a business account.
    public let switchInlineQueryChosenChat: TGSwitchInlineQueryChosenChat?

    /// Optional. A button that copies the specified text to the clipboard
    public let copyText: TGCopyTextButton?

    /// Optional. If set, then the button is disabled and does nothing
    public let disabled: TGDisabledButton?

    public init (text: TGRichText, style: String? = nil, url: String? = nil, callbackData: String? = nil, webApp: TGWebAppInfo? = nil, loginUrl: TGLoginUrl? = nil, switchInlineQuery: String? = nil, switchInlineQueryCurrentChat: String? = nil, switchInlineQueryChosenChat: TGSwitchInlineQueryChosenChat? = nil, copyText: TGCopyTextButton? = nil, disabled: TGDisabledButton? = nil) {
        self.text = text
        self.style = style
        self.url = url
        self.callbackData = callbackData
        self.webApp = webApp
        self.loginUrl = loginUrl
        self.switchInlineQuery = switchInlineQuery
        self.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
        self.switchInlineQueryChosenChat = switchInlineQueryChosenChat
        self.copyText = copyText
        self.disabled = disabled
    }
}
