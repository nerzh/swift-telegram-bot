// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An item of a list to be sent.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockListItem](https://core.telegram.org/bots/api#inputrichblocklistitem)
 **/
public final class TGInputRichBlockListItem: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockListItem` struct
    public enum CodingKeys: String, CodingKey {
        case blocks = "blocks"
        case hasCheckbox = "has_checkbox"
        case isChecked = "is_checked"
        case value = "value"
        case type = "type"
    }

    /// The content of the item
    public let blocks: [TGInputRichBlock]

    /// Optional. Pass True if the item has a checkbox
    public let hasCheckbox: Bool?

    /// Optional. Pass True if the item has a checked checkbox
    public let isChecked: Bool?

    /// Optional. For ordered lists, the numeric value of the item label
    public let value: Int?

    /// Optional. For ordered lists, the type of the item label; must be one of “a” for lowercase letters, “A” for uppercase letters, “i” for lowercase Roman numerals, “I” for uppercase Roman numerals, or “1” for decimal numbers
    public let type: TGInputRichBlockListItemType

    public init (blocks: [TGInputRichBlock], hasCheckbox: Bool? = nil, isChecked: Bool? = nil, value: Int? = nil, type: TGInputRichBlockListItemType) {
        self.blocks = blocks
        self.hasCheckbox = hasCheckbox
        self.isChecked = isChecked
        self.value = value
        self.type = type
    }
}
