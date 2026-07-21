// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to an HTTP or tg:// link. Currently, a story can have up to 3 link areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeLink](https://core.telegram.org/bots/api#storyareatypelink)
 */

public enum TGStoryAreaTypeLinkType: String, Codable, Sendable {
    case link = "link"
}