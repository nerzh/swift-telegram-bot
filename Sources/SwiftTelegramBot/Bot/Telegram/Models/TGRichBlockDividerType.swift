// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A divider, corresponding to the HTML tag <hr/>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockDivider](https://core.telegram.org/bots/api#richblockdivider)
 */

public enum TGRichBlockDividerType: String, Codable, Sendable {
    case divider = "divider"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockDividerType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}