// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A block with a mathematical expression in LaTeX format, corresponding to the custom HTML tag <tg-math-block>.

 SeeAlso Telegram Bot API Reference:
 [InputRichBlockMathematicalExpression](https://core.telegram.org/bots/api#inputrichblockmathematicalexpression)
 */

public enum TGInputRichBlockMathematicalExpressionType: String, Codable, Sendable {
    case mathematicalExpression = "mathematical_expression"
}