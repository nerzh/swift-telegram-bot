// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a block in a rich formatted message to be sent. Currently, it can be any of the following types:
 InputRichBlockParagraph
 InputRichBlockSectionHeading
 InputRichBlockPreformatted
 InputRichBlockFooter
 InputRichBlockDivider
 InputRichBlockMathematicalExpression
 InputRichBlockAnchor
 InputRichBlockList
 InputRichBlockBlockQuotation
 InputRichBlockPullQuotation
 InputRichBlockCollage
 InputRichBlockSlideshow
 InputRichBlockTable
 InputRichBlockDetails
 InputRichBlockMap
 InputRichBlockAnimation
 InputRichBlockAudio
 InputRichBlockPhoto
 InputRichBlockVideo
 InputRichBlockVoiceNote
 InputRichBlockThinking

 SeeAlso Telegram Bot API Reference:
 [InputRichBlock](https://core.telegram.org/bots/api#inputrichblock)
 **/
public enum TGInputRichBlock: Codable, Sendable {
    case inputRichBlockParagraph(TGInputRichBlockParagraph)
    case inputRichBlockSectionHeading(TGInputRichBlockSectionHeading)
    case inputRichBlockPreformatted(TGInputRichBlockPreformatted)
    case inputRichBlockFooter(TGInputRichBlockFooter)
    case inputRichBlockDivider(TGInputRichBlockDivider)
    case inputRichBlockMathematicalExpression(TGInputRichBlockMathematicalExpression)
    case inputRichBlockAnchor(TGInputRichBlockAnchor)
    case inputRichBlockList(TGInputRichBlockList)
    case inputRichBlockBlockQuotation(TGInputRichBlockBlockQuotation)
    case inputRichBlockPullQuotation(TGInputRichBlockPullQuotation)
    case inputRichBlockCollage(TGInputRichBlockCollage)
    case inputRichBlockSlideshow(TGInputRichBlockSlideshow)
    case inputRichBlockTable(TGInputRichBlockTable)
    case inputRichBlockDetails(TGInputRichBlockDetails)
    case inputRichBlockMap(TGInputRichBlockMap)
    case inputRichBlockAnimation(TGInputRichBlockAnimation)
    case inputRichBlockAudio(TGInputRichBlockAudio)
    case inputRichBlockPhoto(TGInputRichBlockPhoto)
    case inputRichBlockVideo(TGInputRichBlockVideo)
    case inputRichBlockVoiceNote(TGInputRichBlockVoiceNote)
    case inputRichBlockThinking(TGInputRichBlockThinking)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGInputRichBlockParagraph.self) {
            self = .inputRichBlockParagraph(value)
        } else if let value = try? container.decode(TGInputRichBlockSectionHeading.self) {
            self = .inputRichBlockSectionHeading(value)
        } else if let value = try? container.decode(TGInputRichBlockPreformatted.self) {
            self = .inputRichBlockPreformatted(value)
        } else if let value = try? container.decode(TGInputRichBlockFooter.self) {
            self = .inputRichBlockFooter(value)
        } else if let value = try? container.decode(TGInputRichBlockDivider.self) {
            self = .inputRichBlockDivider(value)
        } else if let value = try? container.decode(TGInputRichBlockMathematicalExpression.self) {
            self = .inputRichBlockMathematicalExpression(value)
        } else if let value = try? container.decode(TGInputRichBlockAnchor.self) {
            self = .inputRichBlockAnchor(value)
        } else if let value = try? container.decode(TGInputRichBlockList.self) {
            self = .inputRichBlockList(value)
        } else if let value = try? container.decode(TGInputRichBlockBlockQuotation.self) {
            self = .inputRichBlockBlockQuotation(value)
        } else if let value = try? container.decode(TGInputRichBlockPullQuotation.self) {
            self = .inputRichBlockPullQuotation(value)
        } else if let value = try? container.decode(TGInputRichBlockCollage.self) {
            self = .inputRichBlockCollage(value)
        } else if let value = try? container.decode(TGInputRichBlockSlideshow.self) {
            self = .inputRichBlockSlideshow(value)
        } else if let value = try? container.decode(TGInputRichBlockTable.self) {
            self = .inputRichBlockTable(value)
        } else if let value = try? container.decode(TGInputRichBlockDetails.self) {
            self = .inputRichBlockDetails(value)
        } else if let value = try? container.decode(TGInputRichBlockMap.self) {
            self = .inputRichBlockMap(value)
        } else if let value = try? container.decode(TGInputRichBlockAnimation.self) {
            self = .inputRichBlockAnimation(value)
        } else if let value = try? container.decode(TGInputRichBlockAudio.self) {
            self = .inputRichBlockAudio(value)
        } else if let value = try? container.decode(TGInputRichBlockPhoto.self) {
            self = .inputRichBlockPhoto(value)
        } else if let value = try? container.decode(TGInputRichBlockVideo.self) {
            self = .inputRichBlockVideo(value)
        } else if let value = try? container.decode(TGInputRichBlockVoiceNote.self) {
            self = .inputRichBlockVoiceNote(value)
        } else if let value = try? container.decode(TGInputRichBlockThinking.self) {
            self = .inputRichBlockThinking(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE InputRichBlock.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputRichBlockParagraph(value):
            try container.encode(value)
        case let .inputRichBlockSectionHeading(value):
            try container.encode(value)
        case let .inputRichBlockPreformatted(value):
            try container.encode(value)
        case let .inputRichBlockFooter(value):
            try container.encode(value)
        case let .inputRichBlockDivider(value):
            try container.encode(value)
        case let .inputRichBlockMathematicalExpression(value):
            try container.encode(value)
        case let .inputRichBlockAnchor(value):
            try container.encode(value)
        case let .inputRichBlockList(value):
            try container.encode(value)
        case let .inputRichBlockBlockQuotation(value):
            try container.encode(value)
        case let .inputRichBlockPullQuotation(value):
            try container.encode(value)
        case let .inputRichBlockCollage(value):
            try container.encode(value)
        case let .inputRichBlockSlideshow(value):
            try container.encode(value)
        case let .inputRichBlockTable(value):
            try container.encode(value)
        case let .inputRichBlockDetails(value):
            try container.encode(value)
        case let .inputRichBlockMap(value):
            try container.encode(value)
        case let .inputRichBlockAnimation(value):
            try container.encode(value)
        case let .inputRichBlockAudio(value):
            try container.encode(value)
        case let .inputRichBlockPhoto(value):
            try container.encode(value)
        case let .inputRichBlockVideo(value):
            try container.encode(value)
        case let .inputRichBlockVoiceNote(value):
            try container.encode(value)
        case let .inputRichBlockThinking(value):
            try container.encode(value)
        }
    }
}
