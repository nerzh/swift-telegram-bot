// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
 */

public enum TGInlineQueryResultVoiceType: String, Codable, Sendable {
    case voice = "voice"
}