// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object contains information about the color scheme for a user's name, message replies and link previews based on a unique gift.

 SeeAlso Telegram Bot API Reference:
 [UniqueGiftColors](https://core.telegram.org/bots/api#uniquegiftcolors)
 **/
public final class TGUniqueGiftColors: Codable, Sendable {

    /// Custom keys for coding/decoding `UniqueGiftColors` struct
    public enum CodingKeys: String, CodingKey {
        case modelCustomEmojiId = "model_custom_emoji_id"
        case symbolCustomEmojiId = "symbol_custom_emoji_id"
        case lightThemeMainColor = "light_theme_main_color"
        case lightThemeOtherColors = "light_theme_other_colors"
        case darkThemeMainColor = "dark_theme_main_color"
        case darkThemeOtherColors = "dark_theme_other_colors"
    }

    /// Custom emoji identifier of the unique gift's model
    public let modelCustomEmojiId: String

    /// Custom emoji identifier of the unique gift's symbol
    public let symbolCustomEmojiId: String

    /// Main color used in light themes; RGB format
    public let lightThemeMainColor: Int

    /// List of 1-3 additional colors used in light themes; RGB format
    public let lightThemeOtherColors: [Int]

    /// Main color used in dark themes; RGB format
    public let darkThemeMainColor: Int

    /// List of 1-3 additional colors used in dark themes; RGB format
    public let darkThemeOtherColors: [Int]

    public init (modelCustomEmojiId: String, symbolCustomEmojiId: String, lightThemeMainColor: Int, lightThemeOtherColors: [Int], darkThemeMainColor: Int, darkThemeOtherColors: [Int]) {
        self.modelCustomEmojiId = modelCustomEmojiId
        self.symbolCustomEmojiId = symbolCustomEmojiId
        self.lightThemeMainColor = lightThemeMainColor
        self.lightThemeOtherColors = lightThemeOtherColors
        self.darkThemeMainColor = darkThemeMainColor
        self.darkThemeOtherColors = darkThemeOtherColors
    }
}
