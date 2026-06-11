// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>.

 SeeAlso Telegram Bot API Reference:
 [RichBlockMathematicalExpression](https://core.telegram.org/bots/api#richblockmathematicalexpression)
 **/
public final class TGRichBlockMathematicalExpression: Codable, Sendable {

    /// Custom keys for coding/decoding `RichBlockMathematicalExpression` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case expression = "expression"
    }

    /// Type of the block, always “mathematical_expression”
    public let type: TGRichBlockMathematicalExpressionType

    /// The mathematical expression in LaTeX format
    public let expression: String

    public init (type: TGRichBlockMathematicalExpressionType, expression: String) {
        self.type = type
        self.expression = expression
    }
}
