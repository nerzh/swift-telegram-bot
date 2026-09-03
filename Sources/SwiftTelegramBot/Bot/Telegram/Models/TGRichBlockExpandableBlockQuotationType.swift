// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block quotation, corresponding to the HTML tag <blockquote> with custom attribute "expandable".

 SeeAlso Telegram Bot API Reference:
 [RichBlockExpandableBlockQuotation](https://core.telegram.org/bots/api#richblockexpandableblockquotation)
 */

public enum TGRichBlockExpandableBlockQuotationType: String, Codable, Sendable {
    case expandableBlockquote = "expandable_blockquote"
}