// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a map, corresponding to the custom HTML tag <tg-map>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockMap](https://core.telegram.org/bots/api#richblockmap)
 */

public enum TGRichBlockMapType: String, Codable, Sendable {
    case map = "map"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockMapType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}