// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about the quoted part of a message that is replied to by the given message.

 SeeAlso Telegram Bot API Reference:
 [TextQuote](https://core.telegram.org/bots/api#textquote)
 **/
public final class TGTextQuote: Codable, Sendable {

    /// Custom keys for coding/decoding `TextQuote` struct
    public enum CodingKeys: String, CodingKey {
        case text = "text"
        case entities = "entities"
        case richTexts = "rich_texts"
        case position = "position"
        case isManual = "is_manual"
    }

    /// Text of the quoted part of a message that is replied to by the given message; may be empty if the quote was chosen from a rich message
    public let text: String

    /// Optional. Special entities that appear in the quote. Currently, only bold, italic, underline, strikethrough, spoiler, custom_emoji, and date_time entities are kept in quotes.
    public let entities: [TGMessageEntity]?

    /// Optional. Rich text of the quote if it was chosen from a rich message. May contain only plain text, RichTextBold, RichTextItalic, RichTextUnderline, RichTextStrikethrough, RichTextSpoiler, RichTextSubscript, RichTextSuperscript, RichTextDateTime, RichTextCustomEmoji, RichTextMathematicalExpression, and arrays of them.
    public let richTexts: [TGRichText]?

    /// Approximate quote position in the original message in UTF-16 code units as specified by the sender. For quotes from rich messages, it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds.
    public let position: Int

    /// Optional. True, if the quote was chosen manually by the message sender. Otherwise, the quote was added automatically by the server.
    public let isManual: Bool?

    public init (text: String, entities: [TGMessageEntity]? = nil, richTexts: [TGRichText]? = nil, position: Int, isManual: Bool? = nil) {
        self.text = text
        self.entities = entities
        self.richTexts = richTexts
        self.position = position
        self.isManual = isManual
    }
}
