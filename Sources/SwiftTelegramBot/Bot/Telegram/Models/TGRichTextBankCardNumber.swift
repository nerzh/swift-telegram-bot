// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text with a bank card number.

 SeeAlso Telegram Bot API Reference:
 [RichTextBankCardNumber](https://core.telegram.org/bots/api#richtextbankcardnumber)
 **/
public final class TGRichTextBankCardNumber: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextBankCardNumber` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case bankCardNumber = "bank_card_number"
    }

    /// Type of the rich text, always “bank_card_number”
    public let type: TGRichTextBankCardNumberType

    /// The text
    public let text: TGRichText

    /// The bank card number
    public let bankCardNumber: String

    public init (type: TGRichTextBankCardNumberType, text: TGRichText, bankCardNumber: String) {
        self.type = type
        self.text = text
        self.bankCardNumber = bankCardNumber
    }
}
