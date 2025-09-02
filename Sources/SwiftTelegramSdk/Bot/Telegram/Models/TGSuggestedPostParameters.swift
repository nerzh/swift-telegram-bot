// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Contains parameters of a post that is being suggested by the bot.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostParameters](https://core.telegram.org/bots/api#suggestedpostparameters)
 **/
public final class TGSuggestedPostParameters: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostParameters` struct
    public enum CodingKeys: String, CodingKey {
        case price = "price"
        case sendDate = "send_date"
    }

    /// Optional. Proposed price for the post. If the field is omitted, then the post is unpaid.
    public let price: TGSuggestedPostPrice?

    /// Optional. Proposed send date of the post. If specified, then the date must be between 300 second and 2678400 seconds (30 days) in the future. If the field is omitted, then the post can be published at any time within 30 days at the sole discretion of the user who approves it.
    public let sendDate: Int?

    public init (price: TGSuggestedPostPrice? = nil, sendDate: Int? = nil) {
        self.price = price
        self.sendDate = sendDate
    }
}
