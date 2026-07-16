// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a photo, corresponding to the HTML tag <img>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockPhoto](https://core.telegram.org/bots/api#inputrichblockphoto)
 **/
public final class TGInputRichBlockPhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case photo = "photo"
        case caption = "caption"
    }

    /// Type of the block, always “photo”
    public let type: TGInputRichBlockPhotoType

    /// The photo. Caption is ignored.
    public let photo: TGInputMediaPhoto

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGInputRichBlockPhotoType, photo: TGInputMediaPhoto, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.photo = photo
        self.caption = caption
    }
}
