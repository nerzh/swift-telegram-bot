// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text paragraph, corresponding to the HTML tag <p>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockParagraph](https://core.telegram.org/bots/api#richblockparagraph)
 **/
public final class TGRichBlockParagraph: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockParagraph` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the block, always “paragraph”
    public let type: TGRichBlockParagraphType

    /// Text of the block
    public let text: TGRichText

    public init (type: TGRichBlockParagraphType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
