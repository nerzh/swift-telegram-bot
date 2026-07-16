// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A slideshow, corresponding to the custom HTML tag <tg-slideshow>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockSlideshow](https://core.telegram.org/bots/api#inputrichblockslideshow)
 */

public enum TGInputRichBlockSlideshowType: String, Codable, Sendable {
    case slideshow = "slideshow"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGInputRichBlockSlideshowType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}