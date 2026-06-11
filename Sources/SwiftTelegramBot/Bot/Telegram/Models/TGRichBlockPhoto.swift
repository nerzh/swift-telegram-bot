// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a photo, corresponding to the HTML tag <photo>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockPhoto](https://core.telegram.org/bots/api#richblockphoto)
 **/
public final class TGRichBlockPhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case photo = "photo"
        case hasSpoiler = "has_spoiler"
        case caption = "caption"
    }

    /// Type of the block, always “photo”
    public let type: TGRichBlockPhotoType

    /// Available sizes of the photo
    public let photo: [TGPhotoSize]

    /// Optional. True, if the media preview is covered by a spoiler animation
    public let hasSpoiler: Bool?

    /// Optional. Caption of the block
    public let caption: TGRichBlockCaption?

    public init (type: TGRichBlockPhotoType, photo: [TGPhotoSize], hasSpoiler: Bool? = nil, caption: TGRichBlockCaption? = nil) {
        self.type = type
        self.photo = photo
        self.hasSpoiler = hasSpoiler
        self.caption = caption
    }
}
