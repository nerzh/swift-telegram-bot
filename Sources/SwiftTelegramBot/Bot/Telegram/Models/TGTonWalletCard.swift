// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a TON wallet card, which is shown on the profile page of a user to everyone.

 SeeAlso Telegram Bot API Reference:
 [TonWalletCard](https://core.telegram.org/bots/api#tonwalletcard)
 **/
public final class TGTonWalletCard: Codable, Sendable {

    /// Custom keys for coding/decoding `TonWalletCard` struct
    public enum CodingKeys: String, CodingKey {
        case address = "address"
        case amount = "amount"
        case stickers = "stickers"
        case backgroundNftAddress = "background_nft_address"
    }

    /// Address of the wallet
    public let address: String

    /// Balance of the wallet, in the smallest units of the cryptocurrency, as a decimal number
    public let amount: String

    /// Stickers placed on the card
    public let stickers: [TGTonWalletCardSticker]

    /// Optional. Address of the NFT of one of the stickers, whose colors must be used for the card background; omitted if the default background must be used
    public let backgroundNftAddress: String?

    public init (address: String, amount: String, stickers: [TGTonWalletCardSticker], backgroundNftAddress: String? = nil) {
        self.address = address
        self.amount = amount
        self.stickers = stickers
        self.backgroundNftAddress = backgroundNftAddress
    }
}
