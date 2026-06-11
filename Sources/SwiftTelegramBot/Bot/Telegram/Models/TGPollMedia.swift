// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 At most one of the optional fields can be present in any given object.

 SeeAlso Telegram Bot API Reference:
 [PollMedia](https://core.telegram.org/bots/api#pollmedia)
 **/
public final class TGPollMedia: Codable, Sendable {

    /// Custom keys for coding/decoding `PollMedia` struct
    public enum CodingKeys: String, CodingKey {
        case animation = "animation"
        case audio = "audio"
        case document = "document"
        case link = "link"
        case livePhoto = "live_photo"
        case location = "location"
        case photo = "photo"
        case sticker = "sticker"
        case venue = "venue"
        case video = "video"
    }

    /// Optional. Media is an animation, information about the animation
    public let animation: TGAnimation?

    /// Optional. Media is an audio file, information about the file; currently, can't be received in a poll option
    public let audio: TGAudio?

    /// Optional. Media is a general file, information about the file; currently, can't be received in a poll option
    public let document: TGDocument?

    /// Optional. The HTTP link attached to the poll option
    public let link: TGLink?

    /// Optional. Media is a live photo, information about the live photo
    public let livePhoto: TGLivePhoto?

    /// Optional. Media is a shared location, information about the location
    public let location: TGLocation?

    /// Optional. Media is a photo, available sizes of the photo
    public let photo: [TGPhotoSize]?

    /// Optional. Media is a sticker, information about the sticker; currently, for poll options only
    public let sticker: TGSticker?

    /// Optional. Media is a venue, information about the venue
    public let venue: TGVenue?

    /// Optional. Media is a video, information about the video
    public let video: TGVideo?

    public init (animation: TGAnimation? = nil, audio: TGAudio? = nil, document: TGDocument? = nil, link: TGLink? = nil, livePhoto: TGLivePhoto? = nil, location: TGLocation? = nil, photo: [TGPhotoSize]? = nil, sticker: TGSticker? = nil, venue: TGVenue? = nil, video: TGVideo? = nil) {
        self.animation = animation
        self.audio = audio
        self.document = document
        self.link = link
        self.livePhoto = livePhoto
        self.location = location
        self.photo = photo
        self.sticker = sticker
        self.venue = venue
        self.video = video
    }
}
