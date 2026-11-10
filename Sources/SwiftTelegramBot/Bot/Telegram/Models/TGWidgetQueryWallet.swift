// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a TON wallet of the user, which is used in a query from a widget.

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryWallet](https://core.telegram.org/bots/api#widgetquerywallet)
 **/
public final class TGWidgetQueryWallet: Codable, Sendable {

    /// Custom keys for coding/decoding `WidgetQueryWallet` struct
    public enum CodingKeys: String, CodingKey {
        case address = "address"
        case amount = "amount"
        case publicKey = "public_key"
        case stateInit = "state_init"
    }

    /// Address of the wallet
    public let address: String

    /// Balance of the wallet, in the smallest units of the cryptocurrency, as a decimal number
    public let amount: String

    /// Optional. Hex-encoded public key of the wallet; omitted if unknown
    public let publicKey: String?

    /// Optional. Base64-encoded serialized StateInit of the wallet contract; omitted if and only if public_key is omitted
    public let stateInit: String?

    public init (address: String, amount: String, publicKey: String? = nil, stateInit: String? = nil) {
        self.address = address
        self.amount = amount
        self.publicKey = publicKey
        self.stateInit = stateInit
    }
}
