// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an HTTP link to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaLink](https://core.telegram.org/bots/api#inputmedialink)
 **/
public final class TGInputMediaLink: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaLink` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
    }

    /// Type of the result, must be link
    public let type: TGInputMediaLinkType

    /// HTTP URL of the link
    public let url: String

    public init (type: TGInputMediaLinkType, url: String) {
        self.type = type
        self.url = url
    }
}
