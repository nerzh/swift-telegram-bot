// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 Describes the affiliate program that issued the affiliate commission received via this transaction.

 SeeAlso Telegram Bot API Reference:
 [TransactionPartnerAffiliateProgram](https://core.telegram.org/bots/api#transactionpartneraffiliateprogram)
 */

public enum TGTransactionPartnerAffiliateProgramType: String, Codable, Sendable {
    case affiliateProgram = "affiliate_program"
}