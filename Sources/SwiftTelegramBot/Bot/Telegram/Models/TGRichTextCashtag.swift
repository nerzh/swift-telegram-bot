// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A cashtag.

 SeeAlso Telegram Bot API Reference:
 [RichTextCashtag](https://core.telegram.org/bots/api#richtextcashtag)
 **/
public final class TGRichTextCashtag: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextCashtag` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case cashtag = "cashtag"
    }

    /// Type of the rich text, always “cashtag”
    public let type: TGRichTextCashtagType

    /// The text
    public let text: TGRichText

    /// The cashtag
    public let cashtag: String

    public init (type: TGRichTextCashtagType, text: TGRichText, cashtag: String) {
        self.type = type
        self.text = text
        self.cashtag = cashtag
    }
}
