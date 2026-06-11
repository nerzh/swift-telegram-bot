// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 A mathematical expression.

 SeeAlso Telegram Bot API Reference:
 [RichTextMathematicalExpression](https://core.telegram.org/bots/api#richtextmathematicalexpression)
 */

public enum TGRichTextMathematicalExpressionType: String, Codable, Sendable {
    case mathematicalExpression = "mathematical_expression"
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = TGRichTextMathematicalExpressionType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}