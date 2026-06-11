// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A slideshow, corresponding to the custom HTML tag <tg-slideshow>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockSlideshow](https://core.telegram.org/bots/api#richblockslideshow)
 */

public enum TGRichBlockSlideshowType: String, Codable, Sendable {
    case slideshow = "slideshow"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockSlideshowType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}