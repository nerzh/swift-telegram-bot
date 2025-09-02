// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The boost was obtained by the creation of a Telegram Premium or a Telegram Star giveaway. This boosts the chat 4 times for the duration of the corresponding Telegram Premium subscription for Telegram Premium giveaways and prize_star_count / 500 times for one year for Telegram Star giveaways.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostSourceGiveaway](https://core.telegram.org/bots/api#chatboostsourcegiveaway)
 **/
public final class TGChatBoostSourceGiveaway: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatBoostSourceGiveaway` struct
    public enum CodingKeys: String, CodingKey {
        case source = "source"
        case giveawayMessageId = "giveaway_message_id"
        case user = "user"
        case prizeStarCount = "prize_star_count"
        case isUnclaimed = "is_unclaimed"
    }

    /// Source of the boost, always “giveaway”
    public let source: String

    /// Identifier of a message in the chat with the giveaway; the message could have been deleted already. May be 0 if the message isn't sent yet.
    public let giveawayMessageId: Int

    /// Optional. User that won the prize in the giveaway if any; for Telegram Premium giveaways only
    public let user: TGUser?

    /// Optional. The number of Telegram Stars to be split between giveaway winners; for Telegram Star giveaways only
    public let prizeStarCount: Int?

    /// Optional. True, if the giveaway was completed, but there was no user to win the prize
    public let isUnclaimed: Bool?

    public init (source: String, giveawayMessageId: Int, user: TGUser? = nil, prizeStarCount: Int? = nil, isUnclaimed: Bool? = nil) {
        self.source = source
        self.giveawayMessageId = giveawayMessageId
        self.user = user
        self.prizeStarCount = prizeStarCount
        self.isUnclaimed = isUnclaimed
    }
}
