// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block quotation, corresponding to the HTML tag <blockquote> with custom attribute "expandable".

 SeeAlso Telegram Bot API Reference:
 [RichBlockExpandableBlockQuotation](https://core.telegram.org/bots/api#richblockexpandableblockquotation)
 **/
public final class TGRichBlockExpandableBlockQuotation: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockExpandableBlockQuotation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case credit = "credit"
    }

    /// Type of the block, always “expandable_blockquote”
    public let type: TGRichBlockExpandableBlockQuotationType

    /// Content of the block
    public let text: TGRichText

    /// Optional. Credit of the block
    public let credit: TGRichText?

    public init (type: TGRichBlockExpandableBlockQuotationType, text: TGRichText, credit: TGRichText? = nil) {
        self.type = type
        self.text = text
        self.credit = credit
    }
}
