// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultLocation](https://core.telegram.org/bots/api#inlinequeryresultlocation)
 */

public enum TGInlineQueryResultLocationType: String, Codable, Sendable {
    case location = "location"
}