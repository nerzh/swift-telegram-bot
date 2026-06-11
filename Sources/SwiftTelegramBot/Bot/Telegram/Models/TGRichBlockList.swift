// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A list of blocks, corresponding to the HTML tag <ul> or <ol> with multiple nested tags <li>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockList](https://core.telegram.org/bots/api#richblocklist)
 **/
public final class TGRichBlockList: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockList` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case items = "items"
    }

    /// Type of the block, always “list”
    public let type: TGRichBlockListType

    /// Items of the list
    public let items: [TGRichBlockListItem]

    public init (type: TGRichBlockListType, items: [TGRichBlockListItem]) {
        self.type = type
        self.items = items
    }
}
