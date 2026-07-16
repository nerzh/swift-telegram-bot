// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A preformatted text block, corresponding to the nested HTML tags <pre> and <code>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockPreformatted](https://core.telegram.org/bots/api#inputrichblockpreformatted)
 */

public enum TGInputRichBlockPreformattedType: String, Codable, Sendable {
    case pre = "pre"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockPreformattedType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}