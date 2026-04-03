// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object defines the parameters for the creation of a managed bot. Information about the created bot will be shared with the bot using the update managed_bot and a Message with the field managed_bot_created.

 SeeAlso Telegram Bot API Reference:
 [KeyboardButtonRequestManagedBot](https://core.telegram.org/bots/api#keyboardbuttonrequestmanagedbot)
 **/
public final class TGKeyboardButtonRequestManagedBot: Codable, Sendable {

    /// Custom keys for coding/decoding `KeyboardButtonRequestManagedBot` struct
    public enum CodingKeys: String, CodingKey {
        case requestId = "request_id"
        case suggestedName = "suggested_name"
        case suggestedUsername = "suggested_username"
    }

    /// Signed 32-bit identifier of the request. Must be unique within the message
    public let requestId: Int

    /// Optional. Suggested name for the bot
    public let suggestedName: String?

    /// Optional. Suggested username for the bot
    public let suggestedUsername: String?

    public init (requestId: Int, suggestedName: String? = nil, suggestedUsername: String? = nil) {
        self.requestId = requestId
        self.suggestedName = suggestedName
        self.suggestedUsername = suggestedUsername
    }
}
