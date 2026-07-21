// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a live photo to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputMediaLivePhoto](https://core.telegram.org/bots/api#inputmedialivephoto)
 */

public enum TGInputMediaLivePhotoType: String, Codable, Sendable {
    case livePhoto = "live_photo"
}