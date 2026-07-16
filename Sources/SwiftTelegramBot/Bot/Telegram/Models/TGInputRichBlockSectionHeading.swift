// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockSectionHeading](https://core.telegram.org/bots/api#inputrichblocksectionheading)
 **/
public final class TGInputRichBlockSectionHeading: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockSectionHeading` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case size = "size"
    }

    /// Type of the block, always “heading”
    public let type: TGInputRichBlockSectionHeadingType

    /// Text of the block
    public let text: TGRichText

    /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    public let size: Int

    public init (type: TGInputRichBlockSectionHeadingType, text: TGRichText, size: Int) {
        self.type = type
        self.text = text
        self.size = size
    }
}
