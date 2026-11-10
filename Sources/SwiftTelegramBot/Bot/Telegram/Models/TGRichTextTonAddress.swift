// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An address in the TON blockchain.

 SeeAlso Telegram Bot API Reference:
 [RichTextTonAddress](https://core.telegram.org/bots/api#richtexttonaddress)
 **/
public final class TGRichTextTonAddress: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextTonAddress` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
        case address = "address"
    }

    /// Type of the rich text, always “ton_address”
    public let type: TGRichTextTonAddressType

    /// Text of the address
    public let text: TGRichText

    /// The address
    public let address: String

    public init (type: TGRichTextTonAddressType, text: TGRichText, address: String) {
        self.type = type
        self.text = text
        self.address = address
    }
}
