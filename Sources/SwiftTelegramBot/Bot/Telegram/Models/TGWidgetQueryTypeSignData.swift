// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The query contains data signed by a TON wallet of the user who sent the query. The data is signed for the domain bot<bot_id>, where <bot_id> is the identifier of the bot.

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryTypeSignData](https://core.telegram.org/bots/api#widgetquerytypesigndata)
 **/
public final class TGWidgetQueryTypeSignData: Codable, Sendable {

    /// Custom keys for coding/decoding `WidgetQueryTypeSignData` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case wallet = "wallet"
        case signData = "sign_data"
    }

    /// Type of the query, always “sign_data”
    public let type: TGWidgetQueryTypeSignDataType

    /// The wallet that signed the data
    public let wallet: TGWidgetQueryWallet

    /// JSON-serialized signed data
    public let signData: String

    public init (type: TGWidgetQueryTypeSignDataType, wallet: TGWidgetQueryWallet, signData: String) {
        self.type = type
        self.wallet = wallet
        self.signData = signData
    }
}
