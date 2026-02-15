// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the model of a unique gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftModel](https://core.telegram.org/bots/api#uniquegiftmodel)
 **/
public final class TGUniqueGiftModel: Codable, Sendable {

    /// Custom keys for coding/decoding `UniqueGiftModel` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case sticker = "sticker"
        case rarityPerMille = "rarity_per_mille"
        case rarity = "rarity"
    }

    /// Name of the model
    public let name: String

    /// The sticker that represents the unique gift
    public let sticker: TGSticker

    /// The number of unique gifts that receive this model for every 1000 gift upgrades. Always 0 for crafted gifts.
    public let rarityPerMille: Int

    /// Optional. Rarity of the model if it is a crafted model. Currently, can be “uncommon”, “rare”, “epic”, or “legendary”.
    public let rarity: String?

    public init (name: String, sticker: TGSticker, rarityPerMille: Int, rarity: String? = nil) {
        self.name = name
        self.sticker = sticker
        self.rarityPerMille = rarityPerMille
        self.rarity = rarity
    }
}
