// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Deletes a regular gift owned by a managed business account without receiving Telegram Stars for it. Requires the can_convert_gifts_to_stars business bot right. The gift can be deleted only if it isn't limited (the field total_count of the Gift is omitted) and wasn't refunded. Returns True on success.


/// Parameters container struct for `deleteBusinessAccountGift` method
public struct TGDeleteBusinessAccountGiftParams: Encodable, Sendable {

    /// Unique identifier of the business connection
    public let businessConnectionId: String

    /// Unique identifier of the regular gift that should be deleted
    public let ownedGiftId: String

    /// Custom keys for coding/decoding `DeleteBusinessAccountGiftParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case ownedGiftId = "owned_gift_id"
    }

    public init(businessConnectionId: String, ownedGiftId: String) {
            self.businessConnectionId = businessConnectionId
            self.ownedGiftId = ownedGiftId
    }
}


public extension TGBot {

/**
 Deletes a regular gift owned by a managed business account without receiving Telegram Stars for it. Requires the can_convert_gifts_to_stars business bot right. The gift can be deleted only if it isn't limited (the field total_count of the Gift is omitted) and wasn't refunded. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteBusinessAccountGiftParams](https://core.telegram.org/bots/api#deletebusinessaccountgift)
 
 - Parameters:
     - params: Parameters container, see `DeleteBusinessAccountGiftParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteBusinessAccountGift(params: TGDeleteBusinessAccountGiftParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteBusinessAccountGift")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteBusinessAccountGift"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
