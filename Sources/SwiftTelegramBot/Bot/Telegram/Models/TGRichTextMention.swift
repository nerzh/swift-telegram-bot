// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mention by a username.

 SeeAlso Telegram Bot API Reference:
 [RichTextMention](https://core.telegram.org/bots/api#richtextmention)
 **/
public final class TGRichTextMention: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextMention` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case username = "username"
    }

    /// Type of the rich text, always “mention”
    public let type: TGRichTextMentionType

    /// The text
    public let text: TGRichText

    /// The username
    public let username: String

    public init (type: TGRichTextMentionType, text: TGRichText, username: String) {
        self.type = type
        self.text = text
        self.username = username
    }
}
