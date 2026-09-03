// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a general file, corresponding to the custom HTML tag <tg-document>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockDocument](https://core.telegram.org/bots/api#richblockdocument)
 */

public enum TGRichBlockDocumentType: String, Codable, Sendable {
    case document = "document"
}