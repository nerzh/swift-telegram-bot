// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockSectionHeading](https://core.telegram.org/bots/api#richblocksectionheading)
 **/
public final class TGRichBlockSectionHeading: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockSectionHeading` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case size = "size"
    }

    /// Type of the block, always “heading”
    public let type: TGRichBlockSectionHeadingType

    /// Text of the block
    public let text: TGRichText

    /// Relative size of the text font; 1-6, 1 is the largest, 6 is the smallest
    public let size: Int

    public init (type: TGRichBlockSectionHeadingType, text: TGRichText, size: Int) {
        self.type = type
        self.text = text
        self.size = size
    }
}
