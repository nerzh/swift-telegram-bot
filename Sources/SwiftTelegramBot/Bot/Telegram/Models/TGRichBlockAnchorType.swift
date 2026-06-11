// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with an anchor, corresponding to the HTML tag <a> with the attribute name.

 SeeAlso Telegram Bot API Reference:
 [RichBlockAnchor](https://core.telegram.org/bots/api#richblockanchor)
 */

public enum TGRichBlockAnchorType: String, Codable, Sendable {
    case anchor = "anchor"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockAnchorType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}