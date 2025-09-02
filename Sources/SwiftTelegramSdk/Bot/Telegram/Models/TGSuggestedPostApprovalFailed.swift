// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about the failed approval of a suggested post. Currently, only caused by insufficient user funds at the time of approval.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostApprovalFailed](https://core.telegram.org/bots/api#suggestedpostapprovalfailed)
 **/
public final class TGSuggestedPostApprovalFailed: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostApprovalFailed` struct
    public enum CodingKeys: String, CodingKey {
        case suggestedPostMessage = "suggested_post_message"
        case price = "price"
    }

    /// Optional. Message containing the suggested post whose approval has failed. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let suggestedPostMessage: TGMessage?

    /// Expected price of the post
    public let price: TGSuggestedPostPrice

    public init (suggestedPostMessage: TGMessage? = nil, price: TGSuggestedPostPrice) {
        self.suggestedPostMessage = suggestedPostMessage
        self.price = price
    }
}
