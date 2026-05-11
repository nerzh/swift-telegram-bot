// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success.


/// Parameters container struct for `getBusinessAccountGifts` method
public struct TGGetBusinessAccountGiftsParams: Encodable, Sendable {

    /// Unique identifier of the business connection
    public let businessConnectionId: String

    /// Pass True to exclude gifts that aren't saved to the account's profile page
    public let excludeUnsaved: Bool?

    /// Pass True to exclude gifts that are saved to the account's profile page
    public let excludeSaved: Bool?

    /// Pass True to exclude gifts that can be purchased an unlimited number of times
    public let excludeUnlimited: Bool?

    /// Pass True to exclude gifts that can be purchased a limited number of times and can be upgraded to unique
    public let excludeLimitedUpgradable: Bool?

    /// Pass True to exclude gifts that can be purchased a limited number of times and can't be upgraded to unique
    public let excludeLimitedNonUpgradable: Bool?

    /// Pass True to exclude unique gifts
    public let excludeUnique: Bool?

    /// Pass True to exclude gifts that were assigned from the TON blockchain and can't be resold or transferred in Telegram
    public let excludeFromBlockchain: Bool?

    /// Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    public let sortByPrice: Bool?

    /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    public let offset: String?

    /// The maximum number of gifts to be returned; 1-100. Defaults to 100.
    public let limit: Int?

    /// Custom keys for coding/decoding `GetBusinessAccountGiftsParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case excludeUnsaved = "exclude_unsaved"
            case excludeSaved = "exclude_saved"
            case excludeUnlimited = "exclude_unlimited"
            case excludeLimitedUpgradable = "exclude_limited_upgradable"
            case excludeLimitedNonUpgradable = "exclude_limited_non_upgradable"
            case excludeUnique = "exclude_unique"
            case excludeFromBlockchain = "exclude_from_blockchain"
            case sortByPrice = "sort_by_price"
            case offset = "offset"
            case limit = "limit"
    }

    public init(businessConnectionId: String, excludeUnsaved: Bool? = nil, excludeSaved: Bool? = nil, excludeUnlimited: Bool? = nil, excludeLimitedUpgradable: Bool? = nil, excludeLimitedNonUpgradable: Bool? = nil, excludeUnique: Bool? = nil, excludeFromBlockchain: Bool? = nil, sortByPrice: Bool? = nil, offset: String? = nil, limit: Int? = nil) {
            self.businessConnectionId = businessConnectionId
            self.excludeUnsaved = excludeUnsaved
            self.excludeSaved = excludeSaved
            self.excludeUnlimited = excludeUnlimited
            self.excludeLimitedUpgradable = excludeLimitedUpgradable
            self.excludeLimitedNonUpgradable = excludeLimitedNonUpgradable
            self.excludeUnique = excludeUnique
            self.excludeFromBlockchain = excludeFromBlockchain
            self.sortByPrice = sortByPrice
            self.offset = offset
            self.limit = limit
    }
}


public extension TGBot {

/**
 Returns the gifts received and owned by a managed business account. Requires the can_view_gifts_and_stars business bot right. Returns OwnedGifts on success.

 SeeAlso Telegram Bot API Reference:
 [GetBusinessAccountGiftsParams](https://core.telegram.org/bots/api#getbusinessaccountgifts)
 
 - Parameters:
     - params: Parameters container, see `GetBusinessAccountGiftsParams` struct
 - Throws: Throws on errors
 - Returns: `TGOwnedGifts`
 */

    @discardableResult
    func getBusinessAccountGifts(params: TGGetBusinessAccountGiftsParams) async throws -> TGOwnedGifts {
        guard let methodURL: URL = .init(string: getMethodURL("getBusinessAccountGifts")) else {
            throw BotError("Bad URL: \(getMethodURL("getBusinessAccountGifts"))")
        }
        let result: TGOwnedGifts = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
