// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A cashtag.

 SeeAlso Telegram Bot API Reference:
 [RichTextCashtag](https://core.telegram.org/bots/api#richtextcashtag)
 */

public enum TGRichTextCashtagType: String, Codable, Sendable {
    case cashtag = "cashtag"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextCashtagType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}