// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with a link.

 SeeAlso Telegram Bot API Reference:
 [RichTextUrl](https://core.telegram.org/bots/api#richtexturl)
 */

public enum TGRichTextUrlType: String, Codable, Sendable {
    case url = "url"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextUrlType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}