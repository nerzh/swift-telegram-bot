// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a keyboard button to be used by a user of a Mini App.

 SeeAlso Telegram Bot API Reference:
 [PreparedKeyboardButton](https://core.telegram.org/bots/api#preparedkeyboardbutton)
 **/
public final class TGPreparedKeyboardButton: Codable, Sendable {

    /// Custom keys for coding/decoding `PreparedKeyboardButton` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
    }

    /// Unique identifier of the keyboard button
    public let id: String

    public init (id: String) {
        self.id = id
    }
}
