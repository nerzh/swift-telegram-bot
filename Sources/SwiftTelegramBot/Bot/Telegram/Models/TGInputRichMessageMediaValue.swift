// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Represents a possible value of `InputRichMessageMedia.media`.

 SeeAlso Telegram Bot API Reference:
 [InputRichMessageMedia](https://core.telegram.org/bots/api#inputrichmessagemedia)
 **/
public enum TGInputRichMessageMediaValue: Codable, Sendable {
    case inputMediaAnimation(TGInputMediaAnimation)
    case inputMediaAudio(TGInputMediaAudio)
    case inputMediaPhoto(TGInputMediaPhoto)
    case inputMediaVideo(TGInputMediaVideo)
    case inputMediaVoiceNote(TGInputMediaVoiceNote)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputMediaAnimation.self) {
            self = .inputMediaAnimation(value)
        } else if let value = try? container.decode(TGInputMediaAudio.self) {
            self = .inputMediaAudio(value)
        } else if let value = try? container.decode(TGInputMediaPhoto.self) {
            self = .inputMediaPhoto(value)
        } else if let value = try? container.decode(TGInputMediaVideo.self) {
            self = .inputMediaVideo(value)
        } else if let value = try? container.decode(TGInputMediaVoiceNote.self) {
            self = .inputMediaVoiceNote(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputRichMessageMediaValue.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputMediaAnimation(value):
            try container.encode(value)
        case let .inputMediaAudio(value):
            try container.encode(value)
        case let .inputMediaPhoto(value):
            try container.encode(value)
        case let .inputMediaVideo(value):
            try container.encode(value)
        case let .inputMediaVoiceNote(value):
            try container.encode(value)
        }
    }
}
