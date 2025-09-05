// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes a withdrawal transaction to the Telegram Ads platform.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerTelegramAds](https://core.telegram.org/bots/api#transactionpartnertelegramads)
 **/
public final class TGTransactionPartnerTelegramAds: Codable, Sendable {

    /// Custom keys for coding/decoding `TransactionPartnerTelegramAds` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Type of the transaction partner, always “telegram_ads”
    public let type: TGTransactionPartnerTelegramAdsType

    public init (type: TGTransactionPartnerTelegramAdsType) {
        self.type = type
    }
}
