// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A static profile photo in the .JPG format.

 SeeAlso Telegram Bot API Reference:
 [InputProfilePhotoStatic](https://core.telegram.org/bots/api#inputprofilephotostatic)
 **/
public final class TGInputProfilePhotoStatic: Codable, Sendable {

    /// Custom keys for coding/decoding `InputProfilePhotoStatic` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case photo = "photo"
    }

    /// Type of the profile photo, must be static
    public let type: TGInputProfilePhotoStaticType

    /// The static profile photo. Profile photos can't be reused and can only be uploaded as a new file, so you can pass “attach://<file_attach_name>” if the photo was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public let photo: String

    public init (type: TGInputProfilePhotoStaticType, photo: String) {
        self.type = type
        self.photo = photo
    }
}
