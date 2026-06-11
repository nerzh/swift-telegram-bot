// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text covered by a spoiler.

 SeeAlso Telegram Bot API Reference:
 [RichTextSpoiler](https://core.telegram.org/bots/api#richtextspoiler)
 */

public enum TGRichTextSpoilerType: String, Codable, Sendable {
    case spoiler = "spoiler"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextSpoilerType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}