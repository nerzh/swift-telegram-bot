// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a map, corresponding to the custom HTML tag <tg-map>. The map's width and height must not exceed 10000 in total. The width and height ratio must be at most 20.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockMap](https://core.telegram.org/bots/api#inputrichblockmap)
 */

public enum TGInputRichBlockMapType: String, Codable, Sendable {
    case map = "map"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockMapType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}