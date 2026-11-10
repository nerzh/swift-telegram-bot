// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object describes the type of a query from a widget. Currently, it can be one of
 WidgetQueryTypeData
 WidgetQueryTypeSignData
 WidgetQueryTypeSentTransaction

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryType](https://core.telegram.org/bots/api#widgetquerytype)
 **/
public enum TGWidgetQueryType: Codable, Sendable {
    case widgetQueryTypeData(TGWidgetQueryTypeData)
    case widgetQueryTypeSignData(TGWidgetQueryTypeSignData)
    case widgetQueryTypeSentTransaction(TGWidgetQueryTypeSentTransaction)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TGWidgetQueryTypeData.self) {
            self = .widgetQueryTypeData(value)
        } else if let value = try? container.decode(TGWidgetQueryTypeSignData.self) {
            self = .widgetQueryTypeSignData(value)
        } else if let value = try? container.decode(TGWidgetQueryTypeSentTransaction.self) {
            self = .widgetQueryTypeSentTransaction(value)
        } else {
            throw BotError("Failed! Can't decode ANY_TYPE WidgetQueryType.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .widgetQueryTypeData(value):
            try container.encode(value)
        case let .widgetQueryTypeSignData(value):
            try container.encode(value)
        case let .widgetQueryTypeSentTransaction(value):
            try container.encode(value)
        }
    }
}
