// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockMathematicalExpression](https://core.telegram.org/bots/api#richblockmathematicalexpression)
 */

public enum TGRichBlockMathematicalExpressionType: String, Codable, Sendable {
    case mathematicalExpression = "mathematical_expression"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichBlockMathematicalExpressionType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}