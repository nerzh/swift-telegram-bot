// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A divider, corresponding to the HTML tag <hr/>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockDivider](https://core.telegram.org/bots/api#inputrichblockdivider)
 **/
public final class TGInputRichBlockDivider: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichBlockDivider` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the block, always “divider”
    public let type: TGInputRichBlockDividerType

    public init (type: TGInputRichBlockDividerType) {
        self.type = type
    }
}
