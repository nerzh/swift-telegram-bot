// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The reaction is paid.

 SeeAlso Telegram Bot API Reference:
 [ReactionTypePaid](https://core.telegram.org/bots/api#reactiontypepaid)
 */

public enum TGReactionTypePaidType: String, Codable, Sendable {
    case paid = "paid"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGReactionTypePaidType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}