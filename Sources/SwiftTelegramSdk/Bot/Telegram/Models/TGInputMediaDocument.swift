// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a general file to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaDocument](https://core.telegram.org/bots/api#inputmediadocument)
 **/
public final class TGInputMediaDocument: Codable, Sendable {

    /// Custom keys for coding/decoding `InputMediaDocument` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case media = "media"
        case thumbnail = "thumbnail"
        case caption = "caption"
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case disableContentTypeDetection = "disable_content_type_detection"
    }

    /// Type of the result, must be document
    public let type: TGInputMediaDocumentType

    /// File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
    public let media: String

    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
    public let thumbnail: String?

    /// Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
    public let caption: String?

    /// Optional. Mode for parsing entities in the document caption. See formatting options for more details.
    public let parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Optional. Disables automatic server-side content type detection for files uploaded using multipart/form-data. Always True, if the document is sent as part of an album.
    public let disableContentTypeDetection: Bool?

    public init (type: TGInputMediaDocumentType, media: String, thumbnail: String? = nil, caption: String? = nil, parseMode: String? = nil, captionEntities: [TGMessageEntity]? = nil, disableContentTypeDetection: Bool? = nil) {
        self.type = type
        self.media = media
        self.thumbnail = thumbnail
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.disableContentTypeDetection = disableContentTypeDetection
    }
}
