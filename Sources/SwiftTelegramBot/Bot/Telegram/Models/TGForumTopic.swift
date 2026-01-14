// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a forum topic.

 SeeAlso Telegram Bot API Reference:
 [ForumTopic](https://core.telegram.org/bots/api#forumtopic)
 **/
public final class TGForumTopic: Codable, Sendable {

    /// Custom keys for coding/decoding `ForumTopic` struct
    public enum CodingKeys: String, CodingKey {
        case messageThreadId = "message_thread_id"
        case name = "name"
        case iconColor = "icon_color"
        case iconCustomEmojiId = "icon_custom_emoji_id"
        case isNameImplicit = "is_name_implicit"
    }

    /// Unique identifier of the forum topic
    public let messageThreadId: Int

    /// Name of the topic
    public let name: String

    /// Color of the topic icon in RGB format
    public let iconColor: Int

    /// Optional. Unique identifier of the custom emoji shown as the topic icon
    public let iconCustomEmojiId: String?

    /// Optional. True, if the name of the topic wasn't specified explicitly by its creator and likely needs to be changed by the bot
    public let isNameImplicit: Bool?

    public init (messageThreadId: Int, name: String, iconColor: Int, iconCustomEmojiId: String? = nil, isNameImplicit: Bool? = nil) {
        self.messageThreadId = messageThreadId
        self.name = name
        self.iconColor = iconColor
        self.iconCustomEmojiId = iconCustomEmojiId
        self.isNameImplicit = isNameImplicit
    }
}
