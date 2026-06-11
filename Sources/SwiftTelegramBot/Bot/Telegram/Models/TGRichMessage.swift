// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Rich formatted message.

 SeeAlso Telegram Bot API Reference:
 [RichMessage](https://core.telegram.org/bots/api#richmessage)
 **/
public final class TGRichMessage: Codable, Sendable {

    /// Custom keys for coding/decoding `RichMessage` struct
    public enum CodingKeys: String, CodingKey {
        case blocks = "blocks"
        case isRtl = "is_rtl"
    }

    /// Content of the message
    public let blocks: [TGRichBlock]

    /// Optional. True, if the rich message must be shown right-to-left
    public let isRtl: Bool?

    public init (blocks: [TGRichBlock], isRtl: Bool? = nil) {
        self.blocks = blocks
        self.isRtl = isRtl
    }
}
