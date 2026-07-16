// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A footer, corresponding to the HTML tag <footer>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockFooter](https://core.telegram.org/bots/api#inputrichblockfooter)
 **/
public final class TGInputRichBlockFooter: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockFooter` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the block, always “footer”
    public let type: TGInputRichBlockFooterType

    /// Text of the block
    public let text: TGRichText

    public init (type: TGInputRichBlockFooterType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
