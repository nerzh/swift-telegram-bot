// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The query contains data signed by a TON wallet of the user who sent the query. The data is signed for the domain bot<bot_id>, where <bot_id> is the identifier of the bot.

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryTypeSignData](https://core.telegram.org/bots/api#widgetquerytypesigndata)
 */

public enum TGWidgetQueryTypeSignDataType: String, Codable, Sendable {
    case signData = "sign_data"
}