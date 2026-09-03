// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a general file, corresponding to the custom HTML tag <tg-document>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockDocument](https://core.telegram.org/bots/api#inputrichblockdocument)
 */

public enum TGInputRichBlockDocumentType: String, Codable, Sendable {
    case document = "document"
}