// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Contains information about a suggested post.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostInfo](https://core.telegram.org/bots/api#suggestedpostinfo)
 **/
public final class TGSuggestedPostInfo: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostInfo` struct
    public enum CodingKeys: String, CodingKey {
        case state = "state"
        case price = "price"
        case sendDate = "send_date"
    }

    /// State of the suggested post. Currently, it can be one of “pending”, “approved”, “declined”.
    public let state: String

    /// Optional. Proposed price of the post. If the field is omitted, then the post is unpaid.
    public let price: TGSuggestedPostPrice?

    /// Optional. Proposed send date of the post. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user or administrator who approves it.
    public let sendDate: Int?

    public init (state: String, price: TGSuggestedPostPrice? = nil, sendDate: Int? = nil) {
        self.state = state
        self.price = price
        self.sendDate = sendDate
    }
}
