// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A subscript text.

 SeeAlso Telegram Bot API Reference:
 [RichTextSubscript](https://core.telegram.org/bots/api#richtextsubscript)
 */

public enum TGRichTextSubscriptType: String, Codable, Sendable {
    case `subscript` = "subscript"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextSubscriptType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}