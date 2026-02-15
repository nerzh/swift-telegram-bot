// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about the chat owner leaving the chat.

 SeeAlso Telegram Bot API Reference:
 [ChatOwnerLeft](https://core.telegram.org/bots/api#chatownerleft)
 **/
public final class TGChatOwnerLeft: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatOwnerLeft` struct
    public enum CodingKeys: String, CodingKey {
        case newOwner = "new_owner"
    }

    /// Optional. The user which will be the new owner of the chat if the previous owner does not return to the chat
    public let newOwner: TGUser?

    public init (newOwner: TGUser? = nil) {
        self.newOwner = newOwner
    }
}
