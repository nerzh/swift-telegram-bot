// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text covered by a spoiler.

 SeeAlso Telegram Bot API Reference:
 [RichTextSpoiler](https://core.telegram.org/bots/api#richtextspoiler)
 **/
public final class TGRichTextSpoiler: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextSpoiler` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the rich text, always “spoiler”
    public let type: TGRichTextSpoilerType

    /// The text
    public let text: TGRichText

    public init (type: TGRichTextSpoilerType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
