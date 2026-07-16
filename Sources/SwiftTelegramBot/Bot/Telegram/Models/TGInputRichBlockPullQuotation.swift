// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A quotation with centered text, loosely corresponding to the HTML tag <aside>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockPullQuotation](https://core.telegram.org/bots/api#inputrichblockpullquotation)
 **/
public final class TGInputRichBlockPullQuotation: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockPullQuotation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case credit = "credit"
    }

    /// Type of the block, always “pullquote”
    public let type: TGInputRichBlockPullQuotationType

    /// Text of the block
    public let text: TGRichText

    /// Optional. Credit of the block
    public let credit: TGRichText?

    public init (type: TGInputRichBlockPullQuotationType, text: TGRichText, credit: TGRichText? = nil) {
        self.type = type
        self.text = text
        self.credit = credit
    }
}
