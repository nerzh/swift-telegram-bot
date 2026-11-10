// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents an attribute of an NFT in the TON blockchain.

 SeeAlso Telegram Bot API Reference:
 [TonNftAttribute](https://core.telegram.org/bots/api#tonnftattribute)
 **/
public final class TGTonNftAttribute: Codable, Sendable {

    /// Custom keys for coding/decoding `TonNftAttribute` struct
    public enum CodingKeys: String, CodingKey {
        case traitType = "trait_type"
        case value = "value"
    }

    /// Trait type of the attribute
    public let traitType: String

    /// Value of the attribute
    public let value: String

    public init (traitType: String, value: String) {
        self.traitType = traitType
        self.value = value
    }
}
