// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The query notifies the bot about a transaction sent from a TON wallet of the user who sent the query.

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryTypeSentTransaction](https://core.telegram.org/bots/api#widgetquerytypesenttransaction)
 */

public enum TGWidgetQueryTypeSentTransactionType: String, Codable, Sendable {
    case sentTransaction = "sent_transaction"
}