// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a unique gift received and owned by a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [OwnedGiftUnique](https://core.telegram.org/bots/api#ownedgiftunique)
 **/
public final class TGOwnedGiftUnique: Codable, Sendable {

    /// Custom keys for coding/decoding `OwnedGiftUnique` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case gift = "gift"
        case ownedGiftId = "owned_gift_id"
        case senderUser = "sender_user"
        case sendDate = "send_date"
        case isSaved = "is_saved"
        case canBeTransferred = "can_be_transferred"
        case transferStarCount = "transfer_star_count"
        case nextTransferDate = "next_transfer_date"
    }

    /// Type of the gift, always “unique”
    public let type: TGOwnedGiftUniqueType

    /// Information about the unique gift
    public let gift: TGUniqueGift

    /// Optional. Unique identifier of the received gift for the bot; for gifts received on behalf of business accounts only
    public let ownedGiftId: String?

    /// Optional. Sender of the gift if it is a known user
    public let senderUser: TGUser?

    /// Date the gift was sent in Unix time
    public let sendDate: Int

    /// Optional. True, if the gift is displayed on the account's profile page; for gifts received on behalf of business accounts only
    public let isSaved: Bool?

    /// Optional. True, if the gift can be transferred to another owner; for gifts received on behalf of business accounts only
    public let canBeTransferred: Bool?

    /// Optional. Number of Telegram Stars that must be paid to transfer the gift; omitted if the bot cannot transfer the gift
    public let transferStarCount: Int?

    /// Optional. Point in time (Unix timestamp) when the gift can be transferred. If it is in the past, then the gift can be transferred now
    public let nextTransferDate: Int?

    public init (type: TGOwnedGiftUniqueType, gift: TGUniqueGift, ownedGiftId: String? = nil, senderUser: TGUser? = nil, sendDate: Int, isSaved: Bool? = nil, canBeTransferred: Bool? = nil, transferStarCount: Int? = nil, nextTransferDate: Int? = nil) {
        self.type = type
        self.gift = gift
        self.ownedGiftId = ownedGiftId
        self.senderUser = senderUser
        self.sendDate = sendDate
        self.isSaved = isSaved
        self.canBeTransferred = canBeTransferred
        self.transferStarCount = transferStarCount
        self.nextTransferDate = nextTransferDate
    }
}
