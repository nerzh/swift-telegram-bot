// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mention of a Telegram user by their identifier.

 SeeAlso Telegram Bot API Reference:
 [RichTextTextMention](https://core.telegram.org/bots/api#richtexttextmention)
 **/
public final class TGRichTextTextMention: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextTextMention` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case user = "user"
    }

    /// Type of the rich text, always “text_mention”
    public let type: TGRichTextTextMentionType

    /// The text
    public let text: TGRichText

    /// The mentioned user
    public let user: TGUser

    public init (type: TGRichTextTextMentionType, text: TGRichText, user: TGUser) {
        self.type = type
        self.text = text
        self.user = user
    }
}
