// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a block in a rich formatted message. Currently, it can be any of the following types:
 RichBlockParagraph
 RichBlockSectionHeading
 RichBlockPreformatted
 RichBlockFooter
 RichBlockDivider
 RichBlockMathematicalExpression
 RichBlockAnchor
 RichBlockList
 RichBlockBlockQuotation
 RichBlockPullQuotation
 RichBlockCollage
 RichBlockSlideshow
 RichBlockTable
 RichBlockDetails
 RichBlockMap
 RichBlockAnimation
 RichBlockAudio
 RichBlockPhoto
 RichBlockVideo
 RichBlockVoiceNote
 RichBlockThinking

 SeeAlso Telegram Bot API Reference:
 [RichBlock](https://core.telegram.org/bots/api#richblock)
 **/
public enum TGRichBlock: Codable, Sendable {
    case richBlockParagraph(TGRichBlockParagraph)
    case richBlockSectionHeading(TGRichBlockSectionHeading)
    case richBlockPreformatted(TGRichBlockPreformatted)
    case richBlockFooter(TGRichBlockFooter)
    case richBlockDivider(TGRichBlockDivider)
    case richBlockMathematicalExpression(TGRichBlockMathematicalExpression)
    case richBlockAnchor(TGRichBlockAnchor)
    case richBlockList(TGRichBlockList)
    case richBlockBlockQuotation(TGRichBlockBlockQuotation)
    case richBlockPullQuotation(TGRichBlockPullQuotation)
    case richBlockCollage(TGRichBlockCollage)
    case richBlockSlideshow(TGRichBlockSlideshow)
    case richBlockTable(TGRichBlockTable)
    case richBlockDetails(TGRichBlockDetails)
    case richBlockMap(TGRichBlockMap)
    case richBlockAnimation(TGRichBlockAnimation)
    case richBlockAudio(TGRichBlockAudio)
    case richBlockPhoto(TGRichBlockPhoto)
    case richBlockVideo(TGRichBlockVideo)
    case richBlockVoiceNote(TGRichBlockVoiceNote)
    case richBlockThinking(TGRichBlockThinking)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGRichBlockParagraph.self) {
            self = .richBlockParagraph(value)
        } else if let value = try? container.decode(TGRichBlockSectionHeading.self) {
            self = .richBlockSectionHeading(value)
        } else if let value = try? container.decode(TGRichBlockPreformatted.self) {
            self = .richBlockPreformatted(value)
        } else if let value = try? container.decode(TGRichBlockFooter.self) {
            self = .richBlockFooter(value)
        } else if let value = try? container.decode(TGRichBlockDivider.self) {
            self = .richBlockDivider(value)
        } else if let value = try? container.decode(TGRichBlockMathematicalExpression.self) {
            self = .richBlockMathematicalExpression(value)
        } else if let value = try? container.decode(TGRichBlockAnchor.self) {
            self = .richBlockAnchor(value)
        } else if let value = try? container.decode(TGRichBlockList.self) {
            self = .richBlockList(value)
        } else if let value = try? container.decode(TGRichBlockBlockQuotation.self) {
            self = .richBlockBlockQuotation(value)
        } else if let value = try? container.decode(TGRichBlockPullQuotation.self) {
            self = .richBlockPullQuotation(value)
        } else if let value = try? container.decode(TGRichBlockCollage.self) {
            self = .richBlockCollage(value)
        } else if let value = try? container.decode(TGRichBlockSlideshow.self) {
            self = .richBlockSlideshow(value)
        } else if let value = try? container.decode(TGRichBlockTable.self) {
            self = .richBlockTable(value)
        } else if let value = try? container.decode(TGRichBlockDetails.self) {
            self = .richBlockDetails(value)
        } else if let value = try? container.decode(TGRichBlockMap.self) {
            self = .richBlockMap(value)
        } else if let value = try? container.decode(TGRichBlockAnimation.self) {
            self = .richBlockAnimation(value)
        } else if let value = try? container.decode(TGRichBlockAudio.self) {
            self = .richBlockAudio(value)
        } else if let value = try? container.decode(TGRichBlockPhoto.self) {
            self = .richBlockPhoto(value)
        } else if let value = try? container.decode(TGRichBlockVideo.self) {
            self = .richBlockVideo(value)
        } else if let value = try? container.decode(TGRichBlockVoiceNote.self) {
            self = .richBlockVoiceNote(value)
        } else if let value = try? container.decode(TGRichBlockThinking.self) {
            self = .richBlockThinking(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE RichBlock.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .richBlockParagraph(value):
            try container.encode(value)
        case let .richBlockSectionHeading(value):
            try container.encode(value)
        case let .richBlockPreformatted(value):
            try container.encode(value)
        case let .richBlockFooter(value):
            try container.encode(value)
        case let .richBlockDivider(value):
            try container.encode(value)
        case let .richBlockMathematicalExpression(value):
            try container.encode(value)
        case let .richBlockAnchor(value):
            try container.encode(value)
        case let .richBlockList(value):
            try container.encode(value)
        case let .richBlockBlockQuotation(value):
            try container.encode(value)
        case let .richBlockPullQuotation(value):
            try container.encode(value)
        case let .richBlockCollage(value):
            try container.encode(value)
        case let .richBlockSlideshow(value):
            try container.encode(value)
        case let .richBlockTable(value):
            try container.encode(value)
        case let .richBlockDetails(value):
            try container.encode(value)
        case let .richBlockMap(value):
            try container.encode(value)
        case let .richBlockAnimation(value):
            try container.encode(value)
        case let .richBlockAudio(value):
            try container.encode(value)
        case let .richBlockPhoto(value):
            try container.encode(value)
        case let .richBlockVideo(value):
            try container.encode(value)
        case let .richBlockVoiceNote(value):
            try container.encode(value)
        case let .richBlockThinking(value):
            try container.encode(value)
        }
    }
}
