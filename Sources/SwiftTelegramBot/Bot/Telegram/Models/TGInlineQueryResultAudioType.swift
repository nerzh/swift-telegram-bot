// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an MP3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultAudio](https://core.telegram.org/bots/api#inlinequeryresultaudio)
 */

public enum TGInlineQueryResultAudioType: String, Codable, Sendable {
    case audio = "audio"
}