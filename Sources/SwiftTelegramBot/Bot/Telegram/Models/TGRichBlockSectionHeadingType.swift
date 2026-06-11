// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A section heading, corresponding to the HTML tags <h1>, <h2>, <h3>, <h4>, <h5>, or <h6>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockSectionHeading](https://core.telegram.org/bots/api#richblocksectionheading)
 */

public enum TGRichBlockSectionHeadingType: String, Codable, Sendable {
    case heading = "heading"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockSectionHeadingType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}