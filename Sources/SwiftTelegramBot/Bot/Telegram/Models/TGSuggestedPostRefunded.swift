// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about a payment refund for a suggested post.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostRefunded](https://core.telegram.org/bots/api#suggestedpostrefunded)
 **/
public final class TGSuggestedPostRefunded: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostRefunded` struct
    public enum CodingKeys: String, CodingKey {
        case suggestedPostMessage = "suggested_post_message"
        case reason = "reason"
    }

    /// Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let suggestedPostMessage: TGMessage?

    /// Reason for the refund. Currently, one of “post_deleted” if the post was deleted within 24 hours of being posted or removed from scheduled messages without being posted, or “payment_refunded” if the payer refunded their payment.
    public let reason: String

    public init (suggestedPostMessage: TGMessage? = nil, reason: String) {
        self.suggestedPostMessage = suggestedPostMessage
        self.reason = reason
    }
}
