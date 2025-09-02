// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area containing weather information. Currently, a story can have up to 3 weather areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeWeather](https://core.telegram.org/bots/api#storyareatypeweather)
 **/
public final class TGStoryAreaTypeWeather: Codable, Sendable {

    /// Custom keys for coding/decoding `StoryAreaTypeWeather` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case temperature = "temperature"
        case emoji = "emoji"
        case backgroundColor = "background_color"
    }

    /// Type of the area, always “weather”
    public let type: TGStoryAreaTypeWeatherType

    /// Temperature, in degree Celsius
    public let temperature: Float

    /// Emoji representing the weather
    public let emoji: String

    /// A color of the area background in the ARGB format
    public let backgroundColor: Int

    public init (type: TGStoryAreaTypeWeatherType, temperature: Float, emoji: String, backgroundColor: Int) {
        self.type = type
        self.temperature = temperature
        self.emoji = emoji
        self.backgroundColor = backgroundColor
    }
}
