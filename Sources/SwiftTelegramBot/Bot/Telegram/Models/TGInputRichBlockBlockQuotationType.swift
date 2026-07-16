// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block quotation, corresponding to the HTML tag <blockquote>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockBlockQuotation](https://core.telegram.org/bots/api#inputrichblockblockquotation)
 */

public enum TGInputRichBlockBlockQuotationType: String, Codable, Sendable {
    case blockquote = "blockquote"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockBlockQuotationType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}