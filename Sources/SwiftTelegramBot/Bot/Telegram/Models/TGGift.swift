// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a gift that can be sent by the bot.

 SeeAlso Telegram Bot API Reference:
 [Gift](https://core.telegram.org/bots/api#gift)
 **/
public final class TGGift: Codable, Sendable {

    /// Custom keys for coding/decoding `Gift` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case sticker = "sticker"
        case starCount = "star_count"
        case upgradeStarCount = "upgrade_star_count"
        case isPremium = "is_premium"
        case hasColors = "has_colors"
        case totalCount = "total_count"
        case remainingCount = "remaining_count"
        case personalTotalCount = "personal_total_count"
        case personalRemainingCount = "personal_remaining_count"
        case background = "background"
        case uniqueGiftVariantCount = "unique_gift_variant_count"
        case publisherChat = "publisher_chat"
    }

    /// Unique identifier of the gift
    public let id: String

    /// The sticker that represents the gift
    public let sticker: TGSticker

    /// The number of Telegram Stars that must be paid to send the sticker
    public let starCount: Int

    /// Optional. The number of Telegram Stars that must be paid to upgrade the gift to a unique one
    public let upgradeStarCount: Int?

    /// Optional. True, if the gift can only be purchased by Telegram Premium subscribers
    public let isPremium: Bool?

    /// Optional. True, if the gift can be used (after being upgraded) to customize a user's appearance
    public let hasColors: Bool?

    /// Optional. The total number of gifts of this type that can be sent by all users; for limited gifts only
    public let totalCount: Int?

    /// Optional. The number of remaining gifts of this type that can be sent by all users; for limited gifts only
    public let remainingCount: Int?

    /// Optional. The total number of gifts of this type that can be sent by the bot; for limited gifts only
    public let personalTotalCount: Int?

    /// Optional. The number of remaining gifts of this type that can be sent by the bot; for limited gifts only
    public let personalRemainingCount: Int?

    /// Optional. Background of the gift
    public let background: TGGiftBackground?

    /// Optional. The total number of different unique gifts that can be obtained by upgrading the gift
    public let uniqueGiftVariantCount: Int?

    /// Optional. Information about the chat that published the gift
    public let publisherChat: TGChat?

    public init (id: String, sticker: TGSticker, starCount: Int, upgradeStarCount: Int? = nil, isPremium: Bool? = nil, hasColors: Bool? = nil, totalCount: Int? = nil, remainingCount: Int? = nil, personalTotalCount: Int? = nil, personalRemainingCount: Int? = nil, background: TGGiftBackground? = nil, uniqueGiftVariantCount: Int? = nil, publisherChat: TGChat? = nil) {
        self.id = id
        self.sticker = sticker
        self.starCount = starCount
        self.upgradeStarCount = upgradeStarCount
        self.isPremium = isPremium
        self.hasColors = hasColors
        self.totalCount = totalCount
        self.remainingCount = remainingCount
        self.personalTotalCount = personalTotalCount
        self.personalRemainingCount = personalRemainingCount
        self.background = background
        self.uniqueGiftVariantCount = uniqueGiftVariantCount
        self.publisherChat = publisherChat
    }
}
