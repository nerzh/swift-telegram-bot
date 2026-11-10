// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The theme based on a unique gift owned by the user or the chat.

 SeeAlso Telegram Bot API Reference:
 [ChatShareThemeUniqueGift](https://core.telegram.org/bots/api#chatsharethemeuniquegift)
 **/
public final class TGChatShareThemeUniqueGift: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatShareThemeUniqueGift` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case gift = "gift"
    }

    /// Type of the theme, always “unique_gift”
    public let type: TGChatShareThemeUniqueGiftType

    /// The gift
    public let gift: TGUniqueGift

    public init (type: TGChatShareThemeUniqueGiftType, gift: TGUniqueGift) {
        self.type = type
        self.gift = gift
    }
}
