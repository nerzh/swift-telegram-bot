// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultVenue](https://core.telegram.org/bots/api#inlinequeryresultvenue)
 */

public enum TGInlineQueryResultVenueType: String, Codable, Sendable {
    case venue = "venue"
}