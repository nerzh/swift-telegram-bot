// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a rich message to be sent. Exactly one of the fields html, markdown, or blocks must be used.

 SeeAlso Telegram Bot API Reference:
 [InputRichMessage](https://core.telegram.org/bots/api#inputrichmessage)
 **/
public final class TGInputRichMessage: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichMessage` struct
    public enum CodingKeys: String, CodingKey {
        case blocks = "blocks"
        case html = "html"
        case markdown = "markdown"
        case media = "media"
        case isRtl = "is_rtl"
        case skipEntityDetection = "skip_entity_detection"
    }

    /// Optional. Content of the rich message to send described as a list of blocks
    public let blocks: [TGInputRichBlock]?

    /// Optional. Content of the rich message to send described using HTML formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    public let html: String?

    /// Optional. Content of the rich message to send described using Markdown formatting. See rich message formatting options for more details. Use media field to specify the media used in the message.
    public let markdown: String?

    /// Optional. List of media that are specified in the markdown or html fields using tg://photo?id=, tg://video?id=, and tg://audio?id= links
    public let media: [TGInputRichMessageMedia]?

    /// Optional. Pass True if the rich message must be shown right-to-left
    public let isRtl: Bool?

    /// Optional. Pass True to skip automatic detection of entities (e.g., URLs, email addresses, username mentions, hashtags, cashtags, bot commands, or phone numbers) in the text
    public let skipEntityDetection: Bool?

    public init (blocks: [TGInputRichBlock]? = nil, html: String? = nil, markdown: String? = nil, media: [TGInputRichMessageMedia]? = nil, isRtl: Bool? = nil, skipEntityDetection: Bool? = nil) {
        self.blocks = blocks
        self.html = html
        self.markdown = markdown
        self.media = media
        self.isRtl = isRtl
        self.skipEntityDetection = skipEntityDetection
    }
}
