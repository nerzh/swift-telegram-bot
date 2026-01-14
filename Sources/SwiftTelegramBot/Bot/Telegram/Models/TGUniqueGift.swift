// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a unique gift that was upgraded from a regular gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGift](https://core.telegram.org/bots/api#uniquegift)
 **/
public final class TGUniqueGift: Codable, Sendable {

    /// Custom keys for coding/decoding `UniqueGift` struct
    public enum CodingKeys: String, CodingKey {
        case giftId = "gift_id"
        case baseName = "base_name"
        case name = "name"
        case number = "number"
        case model = "model"
        case symbol = "symbol"
        case backdrop = "backdrop"
        case isPremium = "is_premium"
        case isFromBlockchain = "is_from_blockchain"
        case colors = "colors"
        case publisherChat = "publisher_chat"
    }

    /// Identifier of the regular gift from which the gift was upgraded
    public let giftId: String

    /// Human-readable name of the regular gift from which this unique gift was upgraded
    public let baseName: String

    /// Unique name of the gift. This name can be used in https://t.me/nft/... links and story areas
    public let name: String

    /// Unique number of the upgraded gift among gifts upgraded from the same regular gift
    public let number: Int

    /// Model of the gift
    public let model: TGUniqueGiftModel

    /// Symbol of the gift
    public let symbol: TGUniqueGiftSymbol

    /// Backdrop of the gift
    public let backdrop: TGUniqueGiftBackdrop

    /// Optional. True, if the original regular gift was exclusively purchaseable by Telegram Premium subscribers
    public let isPremium: Bool?

    /// Optional. True, if the gift is assigned from the TON blockchain and can't be resold or transferred in Telegram
    public let isFromBlockchain: Bool?

    /// Optional. The color scheme that can be used by the gift's owner for the chat's name, replies to messages and link previews; for business account gifts and gifts that are currently on sale only
    public let colors: TGUniqueGiftColors?

    /// Optional. Information about the chat that published the gift
    public let publisherChat: TGChat?

    public init (giftId: String, baseName: String, name: String, number: Int, model: TGUniqueGiftModel, symbol: TGUniqueGiftSymbol, backdrop: TGUniqueGiftBackdrop, isPremium: Bool? = nil, isFromBlockchain: Bool? = nil, colors: TGUniqueGiftColors? = nil, publisherChat: TGChat? = nil) {
        self.giftId = giftId
        self.baseName = baseName
        self.name = name
        self.number = number
        self.model = model
        self.symbol = symbol
        self.backdrop = backdrop
        self.isPremium = isPremium
        self.isFromBlockchain = isFromBlockchain
        self.colors = colors
        self.publisherChat = publisherChat
    }
}
