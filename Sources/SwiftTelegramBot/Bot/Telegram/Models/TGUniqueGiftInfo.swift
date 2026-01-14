// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a unique gift that was sent or received.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftInfo](https://core.telegram.org/bots/api#uniquegiftinfo)
 **/
public final class TGUniqueGiftInfo: Codable, Sendable {

    /// Custom keys for coding/decoding `UniqueGiftInfo` struct
    public enum CodingKeys: String, CodingKey {
        case gift = "gift"
        case origin = "origin"
        case lastResaleCurrency = "last_resale_currency"
        case lastResaleAmount = "last_resale_amount"
        case ownedGiftId = "owned_gift_id"
        case transferStarCount = "transfer_star_count"
        case nextTransferDate = "next_transfer_date"
    }

    /// Information about the gift
    public let gift: TGUniqueGift

    /// Origin of the gift. Currently, either “upgrade” for gifts upgraded from regular gifts, “transfer” for gifts transferred from other users or channels, “resale” for gifts bought from other users, “gifted_upgrade” for upgrades purchased after the gift was sent, or “offer” for gifts bought or sold through gift purchase offers
    public let origin: String

    /// Optional. For gifts bought from other users, the currency in which the payment for the gift was done. Currently, one of “XTR” for Telegram Stars or “TON” for toncoins.
    public let lastResaleCurrency: String?

    /// Optional. For gifts bought from other users, the price paid for the gift in either Telegram Stars or nanotoncoins
    public let lastResaleAmount: Int?

    /// Optional. Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    public let ownedGiftId: String?

    /// Optional. Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    public let transferStarCount: Int?

    /// Optional. Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now
    public let nextTransferDate: Int?

    public init (gift: TGUniqueGift, origin: String, lastResaleCurrency: String? = nil, lastResaleAmount: Int? = nil, ownedGiftId: String? = nil, transferStarCount: Int? = nil, nextTransferDate: Int? = nil) {
        self.gift = gift
        self.origin = origin
        self.lastResaleCurrency = lastResaleCurrency
        self.lastResaleAmount = lastResaleAmount
        self.ownedGiftId = ownedGiftId
        self.transferStarCount = transferStarCount
        self.nextTransferDate = nextTransferDate
    }
}
