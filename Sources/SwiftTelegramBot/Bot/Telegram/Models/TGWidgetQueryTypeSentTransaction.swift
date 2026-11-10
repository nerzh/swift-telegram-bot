// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The query notifies the bot about a transaction sent from a TON wallet of the user who sent the query.

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryTypeSentTransaction](https://core.telegram.org/bots/api#widgetquerytypesenttransaction)
 **/
public final class TGWidgetQueryTypeSentTransaction: Codable, Sendable {

    /// Custom keys for coding/decoding `WidgetQueryTypeSentTransaction` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case wallet = "wallet"
        case msgHash = "msg_hash"
    }

    /// Type of the query, always “sent_transaction”
    public let type: TGWidgetQueryTypeSentTransactionType

    /// The wallet from which the transaction was sent
    public let wallet: TGWidgetQueryWallet

    /// Value of msg_hash of the transaction
    public let msgHash: String

    public init (type: TGWidgetQueryTypeSentTransactionType, wallet: TGWidgetQueryWallet, msgHash: String) {
        self.type = type
        self.wallet = wallet
        self.msgHash = msgHash
    }
}
