// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents the content of a rich message to be sent as the result of an inline query.

 SeeAlso Telegram Bot API Reference:
 [InputRichMessageContent](https://core.telegram.org/bots/api#inputrichmessagecontent)
 **/
public final class TGInputRichMessageContent: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichMessageContent` struct
    public enum CodingKeys: String, CodingKey {
        case richMessage = "rich_message"
    }

    /// The message to be sent
    public let richMessage: TGInputRichMessage

    public init (richMessage: TGInputRichMessage) {
        self.richMessage = richMessage
    }
}
