// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a rich formatted text. Currently, it can be either a String for plain text, an Array of RichText, or any of the following types:
 RichTextBold
 RichTextItalic
 RichTextUnderline
 RichTextStrikethrough
 RichTextSpoiler
 RichTextDateTime
 RichTextTextMention
 RichTextSubscript
 RichTextSuperscript
 RichTextMarked
 RichTextCode
 RichTextCustomEmoji
 RichTextMathematicalExpression
 RichTextUrl
 RichTextEmailAddress
 RichTextPhoneNumber
 RichTextBankCardNumber
 RichTextMention
 RichTextHashtag
 RichTextCashtag
 RichTextBotCommand
 RichTextAnchor
 RichTextAnchorLink
 RichTextReference
 RichTextReferenceLink

 SeeAlso Telegram Bot API Reference:
 [RichText](https://core.telegram.org/bots/api#richtext)
 **/
public enum TGRichText: Codable, Sendable {
    case stringRichText(String)
    case arrayRichText([TGRichText])
    case richTextBold(TGRichTextBold)
    case richTextItalic(TGRichTextItalic)
    case richTextUnderline(TGRichTextUnderline)
    case richTextStrikethrough(TGRichTextStrikethrough)
    case richTextSpoiler(TGRichTextSpoiler)
    case richTextDateTime(TGRichTextDateTime)
    case richTextTextMention(TGRichTextTextMention)
    case richTextSubscript(TGRichTextSubscript)
    case richTextSuperscript(TGRichTextSuperscript)
    case richTextMarked(TGRichTextMarked)
    case richTextCode(TGRichTextCode)
    case richTextCustomEmoji(TGRichTextCustomEmoji)
    case richTextMathematicalExpression(TGRichTextMathematicalExpression)
    case richTextUrl(TGRichTextUrl)
    case richTextEmailAddress(TGRichTextEmailAddress)
    case richTextPhoneNumber(TGRichTextPhoneNumber)
    case richTextBankCardNumber(TGRichTextBankCardNumber)
    case richTextMention(TGRichTextMention)
    case richTextHashtag(TGRichTextHashtag)
    case richTextCashtag(TGRichTextCashtag)
    case richTextBotCommand(TGRichTextBotCommand)
    case richTextAnchor(TGRichTextAnchor)
    case richTextAnchorLink(TGRichTextAnchorLink)
    case richTextReference(TGRichTextReference)
    case richTextReferenceLink(TGRichTextReferenceLink)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .stringRichText(value)
        } else if let value = try? container.decode([TGRichText].self) {
            self = .arrayRichText(value)
        } else if let value = try? container.decode(TGRichTextBold.self) {
            self = .richTextBold(value)
        } else if let value = try? container.decode(TGRichTextItalic.self) {
            self = .richTextItalic(value)
        } else if let value = try? container.decode(TGRichTextUnderline.self) {
            self = .richTextUnderline(value)
        } else if let value = try? container.decode(TGRichTextStrikethrough.self) {
            self = .richTextStrikethrough(value)
        } else if let value = try? container.decode(TGRichTextSpoiler.self) {
            self = .richTextSpoiler(value)
        } else if let value = try? container.decode(TGRichTextDateTime.self) {
            self = .richTextDateTime(value)
        } else if let value = try? container.decode(TGRichTextTextMention.self) {
            self = .richTextTextMention(value)
        } else if let value = try? container.decode(TGRichTextSubscript.self) {
            self = .richTextSubscript(value)
        } else if let value = try? container.decode(TGRichTextSuperscript.self) {
            self = .richTextSuperscript(value)
        } else if let value = try? container.decode(TGRichTextMarked.self) {
            self = .richTextMarked(value)
        } else if let value = try? container.decode(TGRichTextCode.self) {
            self = .richTextCode(value)
        } else if let value = try? container.decode(TGRichTextCustomEmoji.self) {
            self = .richTextCustomEmoji(value)
        } else if let value = try? container.decode(TGRichTextMathematicalExpression.self) {
            self = .richTextMathematicalExpression(value)
        } else if let value = try? container.decode(TGRichTextUrl.self) {
            self = .richTextUrl(value)
        } else if let value = try? container.decode(TGRichTextEmailAddress.self) {
            self = .richTextEmailAddress(value)
        } else if let value = try? container.decode(TGRichTextPhoneNumber.self) {
            self = .richTextPhoneNumber(value)
        } else if let value = try? container.decode(TGRichTextBankCardNumber.self) {
            self = .richTextBankCardNumber(value)
        } else if let value = try? container.decode(TGRichTextMention.self) {
            self = .richTextMention(value)
        } else if let value = try? container.decode(TGRichTextHashtag.self) {
            self = .richTextHashtag(value)
        } else if let value = try? container.decode(TGRichTextCashtag.self) {
            self = .richTextCashtag(value)
        } else if let value = try? container.decode(TGRichTextBotCommand.self) {
            self = .richTextBotCommand(value)
        } else if let value = try? container.decode(TGRichTextAnchor.self) {
            self = .richTextAnchor(value)
        } else if let value = try? container.decode(TGRichTextAnchorLink.self) {
            self = .richTextAnchorLink(value)
        } else if let value = try? container.decode(TGRichTextReference.self) {
            self = .richTextReference(value)
        } else if let value = try? container.decode(TGRichTextReferenceLink.self) {
            self = .richTextReferenceLink(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE RichText.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .stringRichText(value):
            try container.encode(value)
        case let .arrayRichText(value):
            try container.encode(value)
        case let .richTextBold(value):
            try container.encode(value)
        case let .richTextItalic(value):
            try container.encode(value)
        case let .richTextUnderline(value):
            try container.encode(value)
        case let .richTextStrikethrough(value):
            try container.encode(value)
        case let .richTextSpoiler(value):
            try container.encode(value)
        case let .richTextDateTime(value):
            try container.encode(value)
        case let .richTextTextMention(value):
            try container.encode(value)
        case let .richTextSubscript(value):
            try container.encode(value)
        case let .richTextSuperscript(value):
            try container.encode(value)
        case let .richTextMarked(value):
            try container.encode(value)
        case let .richTextCode(value):
            try container.encode(value)
        case let .richTextCustomEmoji(value):
            try container.encode(value)
        case let .richTextMathematicalExpression(value):
            try container.encode(value)
        case let .richTextUrl(value):
            try container.encode(value)
        case let .richTextEmailAddress(value):
            try container.encode(value)
        case let .richTextPhoneNumber(value):
            try container.encode(value)
        case let .richTextBankCardNumber(value):
            try container.encode(value)
        case let .richTextMention(value):
            try container.encode(value)
        case let .richTextHashtag(value):
            try container.encode(value)
        case let .richTextCashtag(value):
            try container.encode(value)
        case let .richTextBotCommand(value):
            try container.encode(value)
        case let .richTextAnchor(value):
            try container.encode(value)
        case let .richTextAnchorLink(value):
            try container.encode(value)
        case let .richTextReference(value):
            try container.encode(value)
        case let .richTextReferenceLink(value):
            try container.encode(value)
        }
    }
}
