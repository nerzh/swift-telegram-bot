// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Caption of a rich formatted block.

 SeeAlso Telegram Bot API Reference:
 [RichBlockCaption](https://core.telegram.org/bots/api#richblockcaption)
 **/
public final class TGRichBlockCaption: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockCaption` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case credit = "credit"
    }

    /// Block caption
    public let text: TGRichText

    /// Optional. Block credit which corresponds to the HTML tag <cite>
    public let credit: TGRichText?

    public init (text: TGRichText, credit: TGRichText? = nil) {
        self.text = text
        self.credit = credit
    }
}
