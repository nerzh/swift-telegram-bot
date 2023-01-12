// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot's message and tapped 'Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.

 SeeAlso Telegram Bot API Reference:
 [ForceReply](https://core.telegram.org/bots/api#forcereply)
 */
public final class TGForceReply: Codable {

    /// Custom keys for coding/decoding `ForceReply` struct
    public enum CodingKeys: String, CodingKey {
        case forceReply = "force_reply"
        case inputFieldPlaceholder = "input_field_placeholder"
        case selective = "selective"
    }

    /// Shows reply interface to the user, as if they manually selected the bot's message and tapped 'Reply'
    public var forceReply: Bool = true

    /// Optional. The placeholder to be shown in the input field when the reply is active; 1-64 characters
    public var inputFieldPlaceholder: String?

    /// Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
    public var selective: Bool?

    public init (forceReply: Bool = true, inputFieldPlaceholder: String? = nil, selective: Bool? = nil) {
        self.forceReply = forceReply
        self.inputFieldPlaceholder = inputFieldPlaceholder
        self.selective = selective
    }
}
