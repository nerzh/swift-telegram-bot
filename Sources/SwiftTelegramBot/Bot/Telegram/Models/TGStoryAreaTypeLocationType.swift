// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a location. Currently, a story can have up to 10 location areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeLocation](https://core.telegram.org/bots/api#storyareatypelocation)
 */

public enum TGStoryAreaTypeLocationType: String, Codable, Sendable {
    case location = "location"
}