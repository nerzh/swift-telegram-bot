// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a “Thinking…” placeholder, corresponding to the custom HTML tag <tg-thinking>. The block may be used only in sendRichMessageDraft, therefore it can't be received in messages. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.

 SeeAlso Telegram Bot API Reference:
 [RichBlockThinking](https://core.telegram.org/bots/api#richblockthinking)
 */

public enum TGRichBlockThinkingType: String, Codable, Sendable {
    case thinking = "thinking"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockThinkingType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}