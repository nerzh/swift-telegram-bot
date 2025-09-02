// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Refunds a successful payment in Telegram Stars. Returns True on success.


/// Parameters container struct for `refundStarPayment` method
public struct TGRefundStarPaymentParams: Encodable, Sendable {

    /// Identifier of the user whose payment will be refunded
    public let userId: Int64

    /// Telegram payment identifier
    public let telegramPaymentChargeId: String

    /// Custom keys for coding/decoding `RefundStarPaymentParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case telegramPaymentChargeId = "telegram_payment_charge_id"
    }

    public init(userId: Int64, telegramPaymentChargeId: String) {
            self.userId = userId
            self.telegramPaymentChargeId = telegramPaymentChargeId
    }
}


public extension TGBot {

/**
 Refunds a successful payment in Telegram Stars. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RefundStarPaymentParams](https://core.telegram.org/bots/api#refundstarpayment)
 
 - Parameters:
     - params: Parameters container, see `RefundStarPaymentParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func refundStarPayment(params: TGRefundStarPaymentParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("refundStarPayment")) else {
            throw BotError("Bad URL: \(getMethodURL("refundStarPayment"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
