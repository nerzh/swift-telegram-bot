// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The background is a .PNG or .TGV (gzipped subset of SVG with MIME type “application/x-tgwallpattern”) pattern to be combined with the background fill chosen by the user.

 SeeAlso Telegram Bot API Reference:
 [BackgroundTypePattern](https://core.telegram.org/bots/api#backgroundtypepattern)
 */

public enum TGBackgroundTypePatternType: String, Codable, Sendable {
    case pattern = "pattern"
}