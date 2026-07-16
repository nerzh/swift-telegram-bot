// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A quotation with centered text, loosely corresponding to the HTML tag <aside>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockPullQuotation](https://core.telegram.org/bots/api#inputrichblockpullquotation)
 */

public enum TGInputRichBlockPullQuotationType: String, Codable, Sendable {
    case pullquote = "pullquote"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockPullQuotationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}