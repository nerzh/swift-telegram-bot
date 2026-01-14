// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a service message about a new forum topic created in the chat.

 SeeAlso Telegram Bot API Reference:
 [ForumTopicCreated](https://core.telegram.org/bots/api#forumtopiccreated)
 **/
public final class TGForumTopicCreated: Codable, Sendable {

    /// Custom keys for coding/decoding `ForumTopicCreated` struct
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case iconColor = "icon_color"
        case iconCustomEmojiId = "icon_custom_emoji_id"
        case isNameImplicit = "is_name_implicit"
    }

    /// Name of the topic
    public let name: String

    /// Color of the topic icon in RGB format
    public let iconColor: Int

    /// Optional. Unique identifier of the custom emoji shown as the topic icon
    public let iconCustomEmojiId: String?

    /// Optional. True, if the name of the topic wasn't specified explicitly by its creator and likely needs to be changed by the bot
    public let isNameImplicit: Bool?

    public init (name: String, iconColor: Int, iconCustomEmojiId: String? = nil, isNameImplicit: Bool? = nil) {
        self.name = name
        self.iconColor = iconColor
        self.iconCustomEmojiId = iconCustomEmojiId
        self.isNameImplicit = isNameImplicit
    }
}
