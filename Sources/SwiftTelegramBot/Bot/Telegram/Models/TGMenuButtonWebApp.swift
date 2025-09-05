// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a menu button, which launches a Web App.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonWebApp](https://core.telegram.org/bots/api#menubuttonwebapp)
 **/
public final class TGMenuButtonWebApp: Codable, Sendable {

    /// Custom keys for coding/decoding `MenuButtonWebApp` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case webApp = "web_app"
    }

    /// Type of the button, must be web_app
    public let type: TGMenuButtonWebAppType

    /// Text on the button
    public let text: String

    /// Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Alternatively, a t.me link to a Web App of the bot can be specified in the object instead of the Web App's URL, in which case the Web App will be opened as if the user pressed the link.
    public let webApp: TGWebAppInfo

    public init (type: TGMenuButtonWebAppType, text: String, webApp: TGWebAppInfo) {
        self.type = type
        self.text = text
        self.webApp = webApp
    }
}
