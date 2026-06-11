// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockList](https://core.telegram.org/bots/api#richblocklist)
 */

public enum TGRichBlockListType: String, Codable, Sendable {
    case list = "list"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockListType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}