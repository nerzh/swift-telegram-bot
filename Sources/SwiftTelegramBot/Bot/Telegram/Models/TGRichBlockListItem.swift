// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 An item of a list.

 SeeAlso Telegram Bot API Reference:
 [RichBlockListItem](https://core.telegram.org/bots/api#richblocklistitem)
 **/
public final class TGRichBlockListItem: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockListItem` struct
    public enum CodingKeys: String, CodingKey {
        case label = "label"
        case blocks = "blocks"
        case hasCheckbox = "has_checkbox"
        case isChecked = "is_checked"
        case value = "value"
        case type = "type"
    }

    /// Label of the item
    public let label: String

    /// The content of the item
    public let blocks: [TGRichBlock]

    /// Optional. True, if the item has a checkbox
    public let hasCheckbox: Bool?

    /// Optional. True, if the item has a checked checkbox
    public let isChecked: Bool?

    /// Optional. For ordered lists, the numeric value of the item label
    public let value: Int?

    /// Optional. For ordered lists, the type of the item label; must be one of “a” for lowercase letters, “A” for uppercase letters, “i” for lowercase Roman numerals, “I” for uppercase Roman numerals, or “1” for decimal numbers
    public let type: TGRichBlockListItemType

    public init (label: String, blocks: [TGRichBlock], hasCheckbox: Bool? = nil, isChecked: Bool? = nil, value: Int? = nil, type: TGRichBlockListItemType) {
        self.label = label
        self.blocks = blocks
        self.hasCheckbox = hasCheckbox
        self.isChecked = isChecked
        self.value = value
        self.type = type
    }
}
