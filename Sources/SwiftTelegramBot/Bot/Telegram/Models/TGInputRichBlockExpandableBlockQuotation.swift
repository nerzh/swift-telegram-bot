// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block quotation, corresponding to the HTML tag <blockquote> with custom attribute "expandable".

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockExpandableBlockQuotation](https://core.telegram.org/bots/api#inputrichblockexpandableblockquotation)
 **/
public final class TGInputRichBlockExpandableBlockQuotation: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockExpandableBlockQuotation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case credit = "credit"
    }

    /// Type of the block, always “expandable_blockquote”
    public let type: TGInputRichBlockExpandableBlockQuotationType

    /// Content of the block
    public let text: TGRichText

    /// Optional. Credit of the block
    public let credit: TGRichText?

    public init (type: TGInputRichBlockExpandableBlockQuotationType, text: TGRichText, credit: TGRichText? = nil) {
        self.type = type
        self.text = text
        self.credit = credit
    }
}
