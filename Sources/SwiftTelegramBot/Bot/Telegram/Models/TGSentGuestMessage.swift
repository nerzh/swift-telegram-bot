// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes an inline message sent by a guest bot.

 SeeAlso Telegram Bot API Reference:
 [SentGuestMessage](https://core.telegram.org/bots/api#sentguestmessage)
 **/
public final class TGSentGuestMessage: Codable, Sendable {

    /// Custom keys for coding/decoding `SentGuestMessage` struct
    public enum CodingKeys: String, CodingKey {
        case inlineMessageId = "inline_message_id"
    }

    /// Identifier of the sent inline message
    public let inlineMessageId: String

    public init (inlineMessageId: String) {
        self.inlineMessageId = inlineMessageId
    }
}
