// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An address in the TON blockchain.

 SeeAlso Telegram Bot API Reference:
 [RichTextTonAddress](https://core.telegram.org/bots/api#richtexttonaddress)
 */

public enum TGRichTextTonAddressType: String, Codable, Sendable {
    case tonAddress = "ton_address"
}