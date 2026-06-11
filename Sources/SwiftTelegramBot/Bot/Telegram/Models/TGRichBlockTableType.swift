// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A table, corresponding to the HTML tag <table>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockTable](https://core.telegram.org/bots/api#richblocktable)
 */

public enum TGRichBlockTableType: String, Codable, Sendable {
    case table = "table"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockTableType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}