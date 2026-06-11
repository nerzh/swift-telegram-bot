// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A hashtag.

 SeeAlso Telegram Bot API Reference:
 [RichTextHashtag](https://core.telegram.org/bots/api#richtexthashtag)
 **/
public final class TGRichTextHashtag: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextHashtag` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case hashtag = "hashtag"
    }

    /// Type of the rich text, always “hashtag”
    public let type: TGRichTextHashtagType

    /// The text
    public let text: TGRichText

    /// The hashtag
    public let hashtag: String

    public init (type: TGRichTextHashtagType, text: TGRichText, hashtag: String) {
        self.type = type
        self.text = text
        self.hashtag = hashtag
    }
}
