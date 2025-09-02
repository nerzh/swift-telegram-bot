// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a clickable area on a story media.

 SeeAlso Telegram Bot API Reference:
 [StoryArea](https://core.telegram.org/bots/api#storyarea)
 **/
public final class TGStoryArea: Codable, Sendable {

    /// Custom keys for coding/decoding `StoryArea` struct
    public enum CodingKeys: String, CodingKey {
        case position = "position"
        case type = "type"
    }

    /// Position of the area
    public let position: TGStoryAreaPosition

    /// Type of the area
    public let type: TGStoryAreaType

    public init (position: TGStoryAreaPosition, type: TGStoryAreaType) {
        self.position = position
        self.type = type
    }
}
