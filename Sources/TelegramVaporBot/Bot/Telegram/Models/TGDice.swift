// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents an animated emoji that displays a random value.

 SeeAlso Telegram Bot API Reference:
 [Dice](https://core.telegram.org/bots/api#dice)
 */
public final class TGDice: Codable {

    /// Custom keys for coding/decoding `Dice` struct
    public enum CodingKeys: String, CodingKey {
        case emoji = "emoji"
        case value = "value"
    }

    /// Emoji on which the dice throw animation is based
    public var emoji: String

    /// Value of the dice, 1-6 for “”, “” and “” base emoji, 1-5 for “” and “” base emoji, 1-64 for “” base emoji
    public var value: Int

    public init (emoji: String, value: Int) {
        self.emoji = emoji
        self.value = value
    }
}
