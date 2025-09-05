// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedVoice](https://core.telegram.org/bots/api#inlinequeryresultcachedvoice)
 */

public enum TGInlineQueryResultCachedVoiceType: String, Codable, Sendable {
    case voice = "voice"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInlineQueryResultCachedVoiceType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}