// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An item of a list.

 SeeAlso Telegram Bot API Reference:
 [RichBlockListItem](https://core.telegram.org/bots/api#richblocklistitem)
 */

public enum TGRichBlockListItemType: String, Codable, Sendable {
    case a = "a"
    case A = "A"
    case i = "i"
    case I = "I"
    case number1 = "1"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockListItemType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}