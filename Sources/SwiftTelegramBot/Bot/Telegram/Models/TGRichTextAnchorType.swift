// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An anchor.

 SeeAlso Telegram Bot API Reference:
 [RichTextAnchor](https://core.telegram.org/bots/api#richtextanchor)
 */

public enum TGRichTextAnchorType: String, Codable, Sendable {
    case anchor = "anchor"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextAnchorType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}