// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an NFT in the TON blockchain.

 SeeAlso Telegram Bot API Reference:
 [TonNft](https://core.telegram.org/bots/api#tonnft)
 **/
public final class TGTonNft: Codable, Sendable {

    /// Custom keys for coding/decoding `TonNft` struct
    public enum CodingKeys: String, CodingKey {
        case address = "address"
        case collectionAddress = "collection_address"
        case index = "index"
        case name = "name"
        case description = "description"
        case attributes = "attributes"
        case gift = "gift"
    }

    /// Address of the NFT
    public let address: String

    /// Optional. Address of the collection to which the NFT belongs; omitted if unknown
    public let collectionAddress: String?

    /// Index of the NFT among all NFTs from the collection as a decimal number
    public let index: String

    /// Name of the NFT
    public let name: String

    /// Description of the NFT
    public let description: String

    /// Optional. Attributes of the NFT
    public let attributes: [TGTonNftAttribute]?

    /// Optional. The unique gift corresponding to the NFT
    public let gift: TGUniqueGift?

    public init (address: String, collectionAddress: String? = nil, index: String, name: String, description: String, attributes: [TGTonNftAttribute]? = nil, gift: TGUniqueGift? = nil) {
        self.address = address
        self.collectionAddress = collectionAddress
        self.index = index
        self.name = name
        self.description = description
        self.attributes = attributes
        self.gift = gift
    }
}
