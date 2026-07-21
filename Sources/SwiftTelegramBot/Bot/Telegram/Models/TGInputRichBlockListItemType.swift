// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An item of a list to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockListItem](https://core.telegram.org/bots/api#inputrichblocklistitem)
 */

public enum TGInputRichBlockListItemType: String, Codable, Sendable {
    case a = "a"
    case A = "A"
    case i = "i"
    case I = "I"
    case number1 = "1"
}