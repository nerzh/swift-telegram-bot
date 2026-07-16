// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A text paragraph, corresponding to the HTML tag <p>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockParagraph](https://core.telegram.org/bots/api#inputrichblockparagraph)
 */

public enum TGInputRichBlockParagraphType: String, Codable, Sendable {
    case paragraph = "paragraph"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockParagraphType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}