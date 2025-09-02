// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a regular gift that was sent or received.

 SeeAlso Telegram Bot API Reference:
 [GiftInfo](https://core.telegram.org/bots/api#giftinfo)
 **/
public final class TGGiftInfo: Codable, Sendable {

    /// Custom keys for coding/decoding `GiftInfo` struct
    public enum CodingKeys: String, CodingKey {
        case gift = "gift"
        case ownedGiftId = "owned_gift_id"
        case convertStarCount = "convert_star_count"
        case prepaidUpgradeStarCount = "prepaid_upgrade_star_count"
        case canBeUpgraded = "can_be_upgraded"
        case text = "text"
        case entities = "entities"
        case isPrivate = "is_private"
    }

    /// Information about the gift
    public let gift: TGGift

    /// Optional. Unique identifier of the received gift for the bot; only present for gifts received on behalf of business accounts
    public let ownedGiftId: String?

    /// Optional. Number of Telegram Stars that can be claimed by the receiver by converting the gift; omitted if conversion to Telegram Stars is impossible
    public let convertStarCount: Int?

    /// Optional. Number of Telegram Stars that were prepaid by the sender for the ability to upgrade the gift
    public let prepaidUpgradeStarCount: Int?

    /// Optional. True, if the gift can be upgraded to a unique gift
    public let canBeUpgraded: Bool?

    /// Optional. Text of the message that was added to the gift
    public let text: String?

    /// Optional. Special entities that appear in the text
    public let entities: [TGMessageEntity]?

    /// Optional. True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
    public let isPrivate: Bool?

    public init (gift: TGGift, ownedGiftId: String? = nil, convertStarCount: Int? = nil, prepaidUpgradeStarCount: Int? = nil, canBeUpgraded: Bool? = nil, text: String? = nil, entities: [TGMessageEntity]? = nil, isPrivate: Bool? = nil) {
        self.gift = gift
        self.ownedGiftId = ownedGiftId
        self.convertStarCount = convertStarCount
        self.prepaidUpgradeStarCount = prepaidUpgradeStarCount
        self.canBeUpgraded = canBeUpgraded
        self.text = text
        self.entities = entities
        self.isPrivate = isPrivate
    }
}
