// Swift Telegram SDK - Telegram Bot Swift SDK.

/**

 SeeAlso Telegram Bot API Reference:
 [EphemeralMessageParameters](https://core.telegram.org/bots/api#ephemeralmessageparameters)
 **/
public final class TGEphemeralMessageParameters: Codable, Sendable {

    /// Custom keys for coding/decoding `EphemeralMessageParameters` struct
    public enum CodingKeys: String, CodingKey {
        case receiverUserId = "receiver_user_id"
        case callbackQueryId = "callback_query_id"
        case replaceCallbackQueryMessage = "replace_callback_query_message"
    }

    /// Identifier of the user who will receive the message. It is not guaranteed that the user will receive the message, especially if they are offline. See here for more details.
    public let receiverUserId: Int64

    /// Optional. Identifier of the callback query which triggered the message, if any
    public let callbackQueryId: String?

    /// Optional. Pass True if the ephemeral message must be shown in place of the original message. Must be False for callback queries from ephemeral messages, which must be edited using regular editEphemeralMessage… methods.
    public let replaceCallbackQueryMessage: Bool?

    public init (receiverUserId: Int64, callbackQueryId: String? = nil, replaceCallbackQueryMessage: Bool? = nil) {
        self.receiverUserId = receiverUserId
        self.callbackQueryId = callbackQueryId
        self.replaceCallbackQueryMessage = replaceCallbackQueryMessage
    }
}
