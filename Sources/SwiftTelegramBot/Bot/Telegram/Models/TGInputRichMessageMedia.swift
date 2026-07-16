// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a media element embedded in an outgoing rich message.

 SeeAlso Telegram Bot API Reference:
 [InputRichMessageMedia](https://core.telegram.org/bots/api#inputrichmessagemedia)
 **/
public final class TGInputRichMessageMedia: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichMessageMedia` struct
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case media = "media"
    }

    /// Unique identifier of the media used in a tg://photo?id=, tg://video?id=, or tg://audio?id= link. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.
    public let id: String

    /// The media to be sent. Everything except the media itself and its properties is ignored.
    public let media: TGInputRichMessageMediaValue

    public init (id: String, media: TGInputRichMessageMediaValue) {
        self.id = id
        self.media = media
    }
}
