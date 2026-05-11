// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The paid media to send is a live photo.

 SeeAlso Telegram Bot API Reference:
 [InputPaidMediaLivePhoto](https://core.telegram.org/bots/api#inputpaidmedialivephoto)
 **/
public final class TGInputPaidMediaLivePhoto: Codable, Sendable {

    /// Custom keys for coding/decoding `InputPaidMediaLivePhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case photo = "photo"
    }

    /// Type of the media, must be live_photo
    public let type: TGInputPaidMediaLivePhotoType

    /// Video of the live photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    public let media: String

    /// The static photo to send. Pass a file_id to send a file that exists on the Telegram servers (recommended) or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    public let photo: String

    public init (type: TGInputPaidMediaLivePhotoType, media: String, photo: String) {
        self.type = type
        self.media = media
        self.photo = photo
    }
}
