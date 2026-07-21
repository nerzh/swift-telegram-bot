// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a story area pointing to a suggested reaction. Currently, a story can have up to 5 suggested reaction areas.

 SeeAlso Telegram Bot API Reference:
 [StoryAreaTypeSuggestedReaction](https://core.telegram.org/bots/api#storyareatypesuggestedreaction)
 */

public enum TGStoryAreaTypeSuggestedReactionType: String, Codable, Sendable {
    case suggestedReaction = "suggested_reaction"
}