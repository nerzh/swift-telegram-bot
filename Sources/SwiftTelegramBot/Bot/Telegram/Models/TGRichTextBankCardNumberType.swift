// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with a bank card number.

 SeeAlso Telegram Bot API Reference:
 [RichTextBankCardNumber](https://core.telegram.org/bots/api#richtextbankcardnumber)
 */

public enum TGRichTextBankCardNumberType: String, Codable, Sendable {
    case bankCardNumber = "bank_card_number"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextBankCardNumberType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}