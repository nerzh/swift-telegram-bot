// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block quotation, corresponding to the HTML tag <blockquote>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockBlockQuotation](https://core.telegram.org/bots/api#richblockblockquotation)
 **/
public final class TGRichBlockBlockQuotation: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockBlockQuotation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case blocks = "blocks"
        case credit = "credit"
    }

    /// Type of the block, always “blockquote”
    public let type: TGRichBlockBlockQuotationType

    /// Content of the block
    public let blocks: [TGRichBlock]

    /// Optional. Credit of the block
    public let credit: TGRichText?

    public init (type: TGRichBlockBlockQuotationType, blocks: [TGRichBlock], credit: TGRichText? = nil) {
        self.type = type
        self.blocks = blocks
        self.credit = credit
    }
}
