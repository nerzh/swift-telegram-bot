// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text paragraph, corresponding to the HTML tag <p>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockParagraph](https://core.telegram.org/bots/api#inputrichblockparagraph)
 **/
public final class TGInputRichBlockParagraph: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockParagraph` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the block, always “paragraph”
    public let type: TGInputRichBlockParagraphType

    /// Text of the block
    public let text: TGRichText

    public init (type: TGInputRichBlockParagraphType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
