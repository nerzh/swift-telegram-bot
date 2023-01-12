// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Represents a menu button, which launches a Web App.

 SeeAlso Telegram Bot API Reference:
 [MenuButtonWebApp](https://core.telegram.org/bots/api#menubuttonwebapp)
 */
public final class TGMenuButtonWebApp: Codable {

    /// Custom keys for coding/decoding `MenuButtonWebApp` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case webApp = "web_app"
    }

    /// Type of the button, must be web_app
    public var type: String

    /// Text on the button
    public var text: String

    /// Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery.
    public var webApp: TGWebAppInfo

    public init (type: String, text: String, webApp: TGWebAppInfo) {
        self.type = type
        self.text = text
        self.webApp = webApp
    }
}
