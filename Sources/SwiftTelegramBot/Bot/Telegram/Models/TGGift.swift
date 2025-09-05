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
        case totalCount = "total_count"
        case remainingCount = "remaining_count"
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

    /// Optional. The total number of the gifts of this type that can be sent; for limited gifts only
    public let totalCount: Int?

    /// Optional. The number of remaining gifts of this type that can be sent; for limited gifts only
    public let remainingCount: Int?

    /// Optional. Information about the chat that published the gift
    public let publisherChat: TGChat?

    public init (id: String, sticker: TGSticker, starCount: Int, upgradeStarCount: Int? = nil, totalCount: Int? = nil, remainingCount: Int? = nil, publisherChat: TGChat? = nil) {
        self.id = id
        self.sticker = sticker
        self.starCount = starCount
        self.upgradeStarCount = upgradeStarCount
        self.totalCount = totalCount
        self.remainingCount = remainingCount
        self.publisherChat = publisherChat
    }
}
