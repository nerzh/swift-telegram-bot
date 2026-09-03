// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A button.

 SeeAlso Telegram Bot API Reference:
 [RichTextButton](https://core.telegram.org/bots/api#richtextbutton)
 **/
public final class TGRichTextButton: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextButton` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case button = "button"
    }

    /// Type of the rich text, always “button”
    public let type: TGRichTextButtonType

    /// The button
    public let button: TGRichMessageButton

    public init (type: TGRichTextButtonType, button: TGRichMessageButton) {
        self.type = type
        self.button = button
    }
}
