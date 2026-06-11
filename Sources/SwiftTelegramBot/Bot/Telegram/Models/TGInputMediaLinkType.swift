// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents an HTTP link to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaLink](https://core.telegram.org/bots/api#inputmedialink)
 */

public enum TGInputMediaLinkType: String, Codable, Sendable {
    case link = "link"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputMediaLinkType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}