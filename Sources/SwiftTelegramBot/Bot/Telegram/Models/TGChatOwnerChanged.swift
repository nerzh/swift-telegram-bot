// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a service message about an ownership change in the chat.

 SeeAlso Telegram Bot API Reference:
 [ChatOwnerChanged](https://core.telegram.org/bots/api#chatownerchanged)
 **/
public final class TGChatOwnerChanged: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatOwnerChanged` struct
    public enum CodingKeys: String, CodingKey {
        case newOwner = "new_owner"
    }

    /// The new owner of the chat
    public let newOwner: TGUser

    public init (newOwner: TGUser) {
        self.newOwner = newOwner
    }
}
