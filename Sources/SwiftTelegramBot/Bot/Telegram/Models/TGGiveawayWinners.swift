// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a message about the completion of a giveaway with public winners.

 SeeAlso Telegram Bot API Reference:
 [GiveawayWinners](https://core.telegram.org/bots/api#giveawaywinners)
 **/
public final class TGGiveawayWinners: Codable, Sendable {

    /// Custom keys for coding/decoding `GiveawayWinners` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case giveawayMessageId = "giveaway_message_id"
        case winnersSelectionDate = "winners_selection_date"
        case winnerCount = "winner_count"
        case winners = "winners"
        case additionalChatCount = "additional_chat_count"
        case prizeStarCount = "prize_star_count"
        case premiumSubscriptionMonthCount = "premium_subscription_month_count"
        case unclaimedPrizeCount = "unclaimed_prize_count"
        case onlyNewMembers = "only_new_members"
        case wasRefunded = "was_refunded"
        case prizeDescription = "prize_description"
    }

    /// The chat that created the giveaway
    public let chat: TGChat

    /// Identifier of the message with the giveaway in the chat
    public let giveawayMessageId: Int

    /// Point in time (Unix timestamp) when winners of the giveaway were selected
    public let winnersSelectionDate: Int

    /// Total number of winners in the giveaway
    public let winnerCount: Int

    /// List of up to 100 winners of the giveaway
    public let winners: [TGUser]

    /// Optional. The number of other chats the user had to join in order to be eligible for the giveaway
    public let additionalChatCount: Int?

    /// Optional. The number of Telegram Stars that were split between giveaway winners; for Telegram Star giveaways only
    public let prizeStarCount: Int?

    /// Optional. The number of months the Telegram Premium subscription won from the giveaway will be active for; for Telegram Premium giveaways only
    public let premiumSubscriptionMonthCount: Int?

    /// Optional. Number of undistributed prizes
    public let unclaimedPrizeCount: Int?

    /// Optional. True, if only users who had joined the chats after the giveaway started were eligible to win
    public let onlyNewMembers: Bool?

    /// Optional. True, if the giveaway was canceled because the payment for it was refunded
    public let wasRefunded: Bool?

    /// Optional. Description of additional giveaway prize
    public let prizeDescription: String?

    public init (chat: TGChat, giveawayMessageId: Int, winnersSelectionDate: Int, winnerCount: Int, winners: [TGUser], additionalChatCount: Int? = nil, prizeStarCount: Int? = nil, premiumSubscriptionMonthCount: Int? = nil, unclaimedPrizeCount: Int? = nil, onlyNewMembers: Bool? = nil, wasRefunded: Bool? = nil, prizeDescription: String? = nil) {
        self.chat = chat
        self.giveawayMessageId = giveawayMessageId
        self.winnersSelectionDate = winnersSelectionDate
        self.winnerCount = winnerCount
        self.winners = winners
        self.additionalChatCount = additionalChatCount
        self.prizeStarCount = prizeStarCount
        self.premiumSubscriptionMonthCount = premiumSubscriptionMonthCount
        self.unclaimedPrizeCount = unclaimedPrizeCount
        self.onlyNewMembers = onlyNewMembers
        self.wasRefunded = wasRefunded
        self.prizeDescription = prizeDescription
    }
}
