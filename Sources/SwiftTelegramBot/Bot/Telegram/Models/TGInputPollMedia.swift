// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents the content of a poll description or a quiz explanation to be sent. It should be one of
 InputMediaAnimation
 InputMediaAudio
 InputMediaDocument
 InputMediaLivePhoto
 InputMediaLocation
 InputMediaPhoto
 InputMediaVenue
 InputMediaVideo

 SeeAlso Telegram Bot API Reference:
 [InputPollMedia](https://core.telegram.org/bots/api#inputpollmedia)
 **/
public enum TGInputPollMedia: Codable, Sendable {
    case inputMediaAnimation(TGInputMediaAnimation)
    case inputMediaAudio(TGInputMediaAudio)
    case inputMediaDocument(TGInputMediaDocument)
    case inputMediaLivePhoto(TGInputMediaLivePhoto)
    case inputMediaLocation(TGInputMediaLocation)
    case inputMediaPhoto(TGInputMediaPhoto)
    case inputMediaVenue(TGInputMediaVenue)
    case inputMediaVideo(TGInputMediaVideo)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputMediaAnimation.self) {
            self = .inputMediaAnimation(value)
        } else if let value = try? container.decode(TGInputMediaAudio.self) {
            self = .inputMediaAudio(value)
        } else if let value = try? container.decode(TGInputMediaDocument.self) {
            self = .inputMediaDocument(value)
        } else if let value = try? container.decode(TGInputMediaLivePhoto.self) {
            self = .inputMediaLivePhoto(value)
        } else if let value = try? container.decode(TGInputMediaLocation.self) {
            self = .inputMediaLocation(value)
        } else if let value = try? container.decode(TGInputMediaPhoto.self) {
            self = .inputMediaPhoto(value)
        } else if let value = try? container.decode(TGInputMediaVenue.self) {
            self = .inputMediaVenue(value)
        } else if let value = try? container.decode(TGInputMediaVideo.self) {
            self = .inputMediaVideo(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputPollMedia.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputMediaAnimation(value):
            try container.encode(value)
        case let .inputMediaAudio(value):
            try container.encode(value)
        case let .inputMediaDocument(value):
            try container.encode(value)
        case let .inputMediaLivePhoto(value):
            try container.encode(value)
        case let .inputMediaLocation(value):
            try container.encode(value)
        case let .inputMediaPhoto(value):
            try container.encode(value)
        case let .inputMediaVenue(value):
            try container.encode(value)
        case let .inputMediaVideo(value):
            try container.encode(value)
        }
    }
}
