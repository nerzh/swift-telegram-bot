// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a sticker on a TON wallet card.

 SeeAlso Telegram Bot API Reference:
 [TonWalletCardSticker](https://core.telegram.org/bots/api#tonwalletcardsticker)
 **/
public final class TGTonWalletCardSticker: Codable, Sendable {

    /// Custom keys for coding/decoding `TonWalletCardSticker` struct
    public enum CodingKeys: String, CodingKey {
        case position = "position"
        case nft = "nft"
    }

    /// Position of the sticker on the card
    public let position: TGAreaPosition

    /// The NFT shown as the sticker
    public let nft: TGTonNft

    public init (position: TGAreaPosition, nft: TGTonNft) {
        self.position = position
        self.nft = nft
    }
}
