// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A monowidth text.

 SeeAlso Telegram Bot API Reference:
 [RichTextCode](https://core.telegram.org/bots/api#richtextcode)
 */

public enum TGRichTextCodeType: String, Codable, Sendable {
    case code = "code"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextCodeType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}