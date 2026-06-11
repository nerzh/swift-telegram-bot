// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A hashtag.

 SeeAlso Telegram Bot API Reference:
 [RichTextHashtag](https://core.telegram.org/bots/api#richtexthashtag)
 */

public enum TGRichTextHashtagType: String, Codable, Sendable {
    case hashtag = "hashtag"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextHashtagType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}