// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An expandable block for details disclosure, corresponding to the HTML tag <details>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockDetails](https://core.telegram.org/bots/api#inputrichblockdetails)
 */

public enum TGInputRichBlockDetailsType: String, Codable, Sendable {
    case details = "details"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockDetailsType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}