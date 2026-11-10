// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains a list of backdrops, which can be used as the background of a theme of the screen for sharing a link to a user or a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatShareThemeBackdrops](https://core.telegram.org/bots/api#chatsharethemebackdrops)
 **/
public final class TGChatShareThemeBackdrops: Codable, Sendable {

    /// Custom keys for coding/decoding `ChatShareThemeBackdrops` struct
    public enum CodingKeys: String, CodingKey {
        case backdrops = "backdrops"
    }

    /// The list of backdrops
    public let backdrops: [TGChatShareThemeBackdrop]

    public init (backdrops: [TGChatShareThemeBackdrop]) {
        self.backdrops = backdrops
    }
}
