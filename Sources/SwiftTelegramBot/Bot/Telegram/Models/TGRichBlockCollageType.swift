// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A collage, corresponding to the custom HTML tag <tg-collage>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockCollage](https://core.telegram.org/bots/api#richblockcollage)
 */

public enum TGRichBlockCollageType: String, Codable, Sendable {
    case collage = "collage"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockCollageType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}