// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mathematical expression.

 SeeAlso Telegram Bot API Reference:
 [RichTextMathematicalExpression](https://core.telegram.org/bots/api#richtextmathematicalexpression)
 **/
public final class TGRichTextMathematicalExpression: Codable, Sendable {

    /// Custom keys for coding/decoding `RichTextMathematicalExpression` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case expression = "expression"
    }

    /// Type of the rich text, always “mathematical_expression”
    public let type: TGRichTextMathematicalExpressionType

    /// The expression in LaTeX format
    public let expression: String

    public init (type: TGRichTextMathematicalExpressionType, expression: String) {
        self.type = type
        self.expression = expression
    }
}
