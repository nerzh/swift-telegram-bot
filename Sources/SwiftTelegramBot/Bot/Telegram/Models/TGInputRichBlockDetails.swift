// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An expandable block for details disclosure, corresponding to the HTML tag <details>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockDetails](https://core.telegram.org/bots/api#inputrichblockdetails)
 **/
public final class TGInputRichBlockDetails: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockDetails` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case summary = "summary"
        case blocks = "blocks"
        case isOpen = "is_open"
    }

    /// Type of the block, always “details”
    public let type: TGInputRichBlockDetailsType

    /// Always shown summary of the block
    public let summary: TGRichText

    /// Content of the block
    public let blocks: [TGInputRichBlock]

    /// Optional. Pass True if the content of the block is visible by default
    public let isOpen: Bool?

    public init (type: TGInputRichBlockDetailsType, summary: TGRichText, blocks: [TGInputRichBlock], isOpen: Bool? = nil) {
        self.type = type
        self.summary = summary
        self.blocks = blocks
        self.isOpen = isOpen
    }
}
