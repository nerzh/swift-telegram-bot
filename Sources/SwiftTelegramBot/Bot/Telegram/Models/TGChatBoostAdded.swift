// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a service message about a user boosting a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatBoostAdded](https://core.telegram.org/bots/api#chatboostadded)
 **/
public final class TGChatBoostAdded: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatBoostAdded` struct
    public enum CodingKeys: String, CodingKey {
        case boostCount = "boost_count"
    }

    /// Number of boosts added by the user
    public let boostCount: Int

    public init (boostCount: Int) {
        self.boostCount = boostCount
    }
}
