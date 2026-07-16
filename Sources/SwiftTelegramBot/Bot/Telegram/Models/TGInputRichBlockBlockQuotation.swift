// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block quotation, corresponding to the HTML tag <blockquote>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockBlockQuotation](https://core.telegram.org/bots/api#inputrichblockblockquotation)
 **/
public final class TGInputRichBlockBlockQuotation: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockBlockQuotation` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case blocks = "blocks"
        case credit = "credit"
    }

    /// Type of the block, always “blockquote”
    public let type: TGInputRichBlockBlockQuotationType

    /// Content of the block
    public let blocks: [TGInputRichBlock]

    /// Optional. Credit of the block
    public let credit: TGRichText?

    public init (type: TGInputRichBlockBlockQuotationType, blocks: [TGInputRichBlock], credit: TGRichText? = nil) {
        self.type = type
        self.blocks = blocks
        self.credit = credit
    }
}
