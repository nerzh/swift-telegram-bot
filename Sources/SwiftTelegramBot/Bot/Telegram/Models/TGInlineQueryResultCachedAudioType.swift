// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an MP3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultCachedAudio](https://core.telegram.org/bots/api#inlinequeryresultcachedaudio)
 */

public enum TGInlineQueryResultCachedAudioType: String, Codable, Sendable {
    case audio = "audio"
}