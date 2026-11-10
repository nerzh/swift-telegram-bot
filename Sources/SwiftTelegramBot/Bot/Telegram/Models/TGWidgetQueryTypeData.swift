// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 The query contains data for the bot.

 SeeAlso Telegram Bot API Reference:
 [WidgetQueryTypeData](https://core.telegram.org/bots/api#widgetquerytypedata)
 **/
public final class TGWidgetQueryTypeData: Codable, Sendable {

    /// Custom keys for coding/decoding `WidgetQueryTypeData` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
        case walletCard = "wallet_card"
    }

    /// Type of the query, always “data”
    public let type: TGWidgetQueryTypeDataType

    /// Optional. TON wallet card of the user who sent the query, if it was sent to the bot along with the query
    public let walletCard: TGTonWalletCard?

    public init (type: TGWidgetQueryTypeDataType, walletCard: TGTonWalletCard? = nil) {
        self.type = type
        self.walletCard = walletCard
    }
}
