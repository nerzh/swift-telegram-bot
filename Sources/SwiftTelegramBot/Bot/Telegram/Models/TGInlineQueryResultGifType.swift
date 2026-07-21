// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultGif](https://core.telegram.org/bots/api#inlinequeryresultgif)
 */

public enum TGInlineQueryResultGifType: String, Codable, Sendable {
    case gif = "gif"
}