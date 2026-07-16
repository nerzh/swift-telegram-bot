// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a “Thinking…” placeholder, corresponding to the custom HTML tag <tg-thinking>. The block may be used only in sendRichMessageDraft, therefore it can't be received in messages. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockThinking](https://core.telegram.org/bots/api#inputrichblockthinking)
 **/
public final class TGInputRichBlockThinking: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockThinking` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case text = "text"
    }

    /// Type of the block, always “thinking”
    public let type: TGInputRichBlockThinkingType

    /// Text of the block. See https://t.me/addemoji/AIActions for examples of custom emoji that are recommended for usage in the block.
    public let text: TGRichText

    public init (type: TGInputRichBlockThinkingType, text: TGRichText) {
        self.type = type
        self.text = text
    }
}
