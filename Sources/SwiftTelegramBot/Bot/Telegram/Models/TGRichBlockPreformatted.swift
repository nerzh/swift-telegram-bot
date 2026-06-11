// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A preformatted text block, corresponding to the nested HTML tags <pre> and <code>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockPreformatted](https://core.telegram.org/bots/api#richblockpreformatted)
 **/
public final class TGRichBlockPreformatted: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockPreformatted` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case language = "language"
    }

    /// Type of the block, always “pre”
    public let type: TGRichBlockPreformattedType

    /// Text of the block
    public let text: TGRichText

    /// Optional. The programming language of the text
    public let language: String?

    public init (type: TGRichBlockPreformattedType, text: TGRichText, language: String? = nil) {
        self.type = type
        self.text = text
        self.language = language
    }
}
