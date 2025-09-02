// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Contains information about the start page settings of a Telegram Business account.

 SeeAlso Telegram Bot API Reference:
 [BusinessIntro](https://core.telegram.org/bots/api#businessintro)
 **/
public final class TGBusinessIntro: Codable, Sendable {

    /// Custom keys for coding/decoding `BusinessIntro` struct
    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case message = "message"
        case sticker = "sticker"
    }

    /// Optional. Title text of the business intro
    public let title: String?

    /// Optional. Message text of the business intro
    public let message: String?

    /// Optional. Sticker of the business intro
    public let sticker: TGSticker?

    public init (title: String? = nil, message: String? = nil, sticker: TGSticker? = nil) {
        self.title = title
        self.message = message
        self.sticker = sticker
    }
}
