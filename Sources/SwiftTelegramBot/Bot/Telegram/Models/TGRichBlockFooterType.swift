// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A footer, corresponding to the HTML tag <footer>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockFooter](https://core.telegram.org/bots/api#richblockfooter)
 */

public enum TGRichBlockFooterType: String, Codable, Sendable {
    case footer = "footer"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockFooterType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}