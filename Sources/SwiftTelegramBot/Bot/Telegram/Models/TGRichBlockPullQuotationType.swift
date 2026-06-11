// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A quotation with centered text, loosely corresponding to the HTML tag <aside>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockPullQuotation](https://core.telegram.org/bots/api#richblockpullquotation)
 */

public enum TGRichBlockPullQuotationType: String, Codable, Sendable {
    case pullquote = "pullquote"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockPullQuotationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}