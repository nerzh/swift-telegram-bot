// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about the rejection of a suggested post.

 SeeAlso Telegram Bot API Reference:
 [SuggestedPostDeclined](https://core.telegram.org/bots/api#suggestedpostdeclined)
 **/
public final class TGSuggestedPostDeclined: Codable, Sendable {

    /// Custom keys for coding/decoding `SuggestedPostDeclined` struct
    public enum CodingKeys: String, CodingKey {
        case suggestedPostMessage = "suggested_post_message"
        case comment = "comment"
    }

    /// Optional. Message containing the suggested post. Note that the Message object in this field will not contain the reply_to_message field even if it itself is a reply.
    public let suggestedPostMessage: TGMessage?

    /// Optional. Comment with which the post was declined
    public let comment: String?

    public init (suggestedPostMessage: TGMessage? = nil, comment: String? = nil) {
        self.suggestedPostMessage = suggestedPostMessage
        self.comment = comment
    }
}
