// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The theme with emoji placed on a background.

 SeeAlso Telegram Bot API Reference:
 [ChatShareThemeEmoji](https://core.telegram.org/bots/api#chatsharethemeemoji)
 **/
public final class TGChatShareThemeEmoji: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatShareThemeEmoji` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case emojis = "emojis"
        case backgroundBackdropId = "background_backdrop_id"
    }

    /// Type of the theme, always “emoji”
    public let type: TGChatShareThemeEmojiType

    /// The emoji; 0-6 regular or custom emoji
    public let emojis: [TGEmojiType]

    /// Optional. Identifier of the backdrop used as the background; omitted if the default background is used. Use getChatShareThemeBackdrops to get details about the backdrop.
    public let backgroundBackdropId: Int?

    public init (type: TGChatShareThemeEmojiType, emojis: [TGEmojiType], backgroundBackdropId: Int? = nil) {
        self.type = type
        self.emojis = emojis
        self.backgroundBackdropId = backgroundBackdropId
    }
}
