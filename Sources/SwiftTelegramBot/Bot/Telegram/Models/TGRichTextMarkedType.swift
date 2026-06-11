// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A marked text.

 SeeAlso Telegram Bot API Reference:
 [RichTextMarked](https://core.telegram.org/bots/api#richtextmarked)
 */

public enum TGRichTextMarkedType: String, Codable, Sendable {
    case marked = "marked"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextMarkedType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}