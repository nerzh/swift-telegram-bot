// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A superscript text.

 SeeAlso Telegram Bot API Reference:
 [RichTextSuperscript](https://core.telegram.org/bots/api#richtextsuperscript)
 */

public enum TGRichTextSuperscriptType: String, Codable, Sendable {
    case superscript = "superscript"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextSuperscriptType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}