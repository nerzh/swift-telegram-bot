// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mention of a Telegram user by their identifier.

 SeeAlso Telegram Bot API Reference:
 [RichTextTextMention](https://core.telegram.org/bots/api#richtexttextmention)
 */

public enum TGRichTextTextMentionType: String, Codable, Sendable {
    case textMention = "text_mention"
}