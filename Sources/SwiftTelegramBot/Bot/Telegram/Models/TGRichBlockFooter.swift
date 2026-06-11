// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A footer, corresponding to the HTML tag <footer>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockFooter](https://core.telegram.org/bots/api#richblockfooter)
 **/
public final class TGRichBlockFooter: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockFooter` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the block, always “footer”
    public let type: TGRichBlockFooterType

    /// Text of the block
    public let text: TGRichText

    public init (type: TGRichBlockFooterType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
