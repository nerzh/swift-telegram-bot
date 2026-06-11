// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A link to an anchor.

 SeeAlso Telegram Bot API Reference:
 [RichTextAnchorLink](https://core.telegram.org/bots/api#richtextanchorlink)
 */

public enum TGRichTextAnchorLinkType: String, Codable, Sendable {
    case anchorLink = "anchor_link"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextAnchorLinkType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}