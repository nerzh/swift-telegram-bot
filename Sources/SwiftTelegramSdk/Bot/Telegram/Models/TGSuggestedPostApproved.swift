// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about the approval of a suggested post.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostApproved](https://core.telegram.org/bots/api#suggestedpostapproved)
 **/
public final class TGSuggestedPostApproved: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostApproved` struct
    public enum CodingKeys: String, CodingKey {
        case suggestedPostMessage = "suggested_post_message"
        case price = "price"
        case sendDate = "send_date"
    }

    /// Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let suggestedPostMessage: TGMessage?

    /// Optional. Amount paid for the post
    public let price: TGSuggestedPostPrice?

    /// Date when the post will be published
    public let sendDate: Int

    public init (suggestedPostMessage: TGMessage? = nil, price: TGSuggestedPostPrice? = nil, sendDate: Int) {
        self.suggestedPostMessage = suggestedPostMessage
        self.price = price
        self.sendDate = sendDate
    }
}
