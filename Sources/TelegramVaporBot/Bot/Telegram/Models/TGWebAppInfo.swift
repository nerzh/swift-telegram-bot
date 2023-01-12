// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Describes a Web App.

 SeeAlso Telegram Bot API Reference:
 [WebAppInfo](https://core.telegram.org/bots/api#webappinfo)
 */
public final class TGWebAppInfo: Codable {

    /// Custom keys for coding/decoding `WebAppInfo` struct
    public enum CodingKeys: String, CodingKey {
        case url = "url"
    }

    /// An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
    public var url: String

    public init (url: String) {
        self.url = url
    }
}
