// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a unique gift. Currently, a story can have at most 1 unique gift area.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeUniqueGift](https://core.telegram.org/bots/api#storyareatypeuniquegift)
 */

public enum TGStoryAreaTypeUniqueGiftType: String, Codable, Sendable {
    case uniqueGift = "unique_gift"
}