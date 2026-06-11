// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a rich message to be sent. Exactly one of the fields html or markdown must be used.

 SeeAlso Telegram Bot API Reference:
 [InputRichMessage](https://core.telegram.org/bots/api#inputrichmessage)
 **/
public final class TGInputRichMessage: Codable, Sendable {

    /// Custom keys for coding/decoding `InputRichMessage` struct
    public enum CodingKeys: String, CodingKey {
        case html = "html"
        case markdown = "markdown"
        case isRtl = "is_rtl"
        case skipEntityDetection = "skip_entity_detection"
    }

    /// Optional. Content of the rich message to send described using HTML formatting. See rich message formatting options for more details.
    public let html: String?

    /// Optional. Content of the rich message to send described using Markdown formatting. See rich message formatting options for more details.
    public let markdown: String?

    /// Optional. Pass True if the rich message must be shown right-to-left
    public let isRtl: Bool?

    /// Optional. Pass True to skip automatic detection of entities (e.g., URLs, email addresses, username mentions, hashtags, cashtags, bot commands, or phone numbers) in the text
    public let skipEntityDetection: Bool?

    public init (html: String? = nil, markdown: String? = nil, isRtl: Bool? = nil, skipEntityDetection: Bool? = nil) {
        self.html = html
        self.markdown = markdown
        self.isRtl = isRtl
        self.skipEntityDetection = skipEntityDetection
    }
}
