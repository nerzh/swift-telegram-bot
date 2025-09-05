// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the symbol shown on the pattern of a unique gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftSymbol](https://core.telegram.org/bots/api#uniquegiftsymbol)
 **/
public final class TGUniqueGiftSymbol: Codable, Sendable {

    /// Custom keys for coding/decoding `UniqueGiftSymbol` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case sticker = "sticker"
        case rarityPerMille = "rarity_per_mille"
    }

    /// Name of the symbol
    public let name: String

    /// The sticker that represents the unique gift
    public let sticker: TGSticker

    /// The number of unique gifts that receive this model for every 1000 gifts upgraded
    public let rarityPerMille: Int

    public init (name: String, sticker: TGSticker, rarityPerMille: Int) {
        self.name = name
        self.sticker = sticker
        self.rarityPerMille = rarityPerMille
    }
}
