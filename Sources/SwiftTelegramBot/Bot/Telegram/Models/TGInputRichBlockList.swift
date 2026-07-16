// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockList](https://core.telegram.org/bots/api#inputrichblocklist)
 **/
public final class TGInputRichBlockList: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockList` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case items = "items"
    }

    /// Type of the block, always “list”
    public let type: TGInputRichBlockListType

    /// Items of the list
    public let items: [TGInputRichBlockListItem]

    public init (type: TGInputRichBlockListType, items: [TGInputRichBlockListItem]) {
        self.type = type
        self.items = items
    }
}
