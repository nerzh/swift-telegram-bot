// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes a backdrop, which can be used as the background of a theme of the screen for sharing a link to a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatShareThemeBackdrop](https://core.telegram.org/bots/api#chatsharethemebackdrop)
 **/
public final class TGChatShareThemeBackdrop: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatShareThemeBackdrop` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case colors = "colors"
    }

    /// Unique identifier of the backdrop
    public let id: Int

    /// Name of the backdrop
    public let name: String

    /// Colors of the backdrop
    public let colors: TGUniqueGiftBackdropColors

    public init (id: Int, name: String, colors: TGUniqueGiftBackdropColors) {
        self.id = id
        self.name = name
        self.colors = colors
    }
}
