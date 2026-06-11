// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A divider, corresponding to the HTML tag <hr/>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockDivider](https://core.telegram.org/bots/api#richblockdivider)
 **/
public final class TGRichBlockDivider: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockDivider` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the block, always “divider”
    public let type: TGRichBlockDividerType

    public init (type: TGRichBlockDividerType) {
        self.type = type
    }
}
