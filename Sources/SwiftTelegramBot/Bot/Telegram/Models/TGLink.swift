// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an HTTP link.

 SeeAlso Telegram Bot API Reference:
 [Link](https://core.telegram.org/bots/api#link)
 **/
public final class TGLink: Codable, Sendable {

    /// Custom keys for coding/decoding `Link` struct
    public enum CodingKeys: String, CodingKey {
        case url = "url"
    }

    /// URL of the link
    public let url: String

    public init (url: String) {
        self.url = url
    }
}
