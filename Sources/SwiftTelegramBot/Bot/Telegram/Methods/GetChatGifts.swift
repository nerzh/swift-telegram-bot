// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Returns the gifts owned by a chat. Returns OwnedGifts on success.


/// Parameters container struct for `getChatGifts` method
public struct TGGetChatGiftsParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Pass True to exclude gifts that aren't saved to the chat's profile page. Always True, unless the bot has the can_post_messages administrator right in the channel.
    public let excludeUnsaved: Bool?

    /// Pass True to exclude gifts that are saved to the chat's profile page. Always False, unless the bot has the can_post_messages administrator right in the channel.
    public let excludeSaved: Bool?

    /// Pass True to exclude gifts that can be purchased an unlimited number of times
    public let excludeUnlimited: Bool?

    /// Pass True to exclude gifts that can be purchased a limited number of times and can be upgraded to unique
    public let excludeLimitedUpgradable: Bool?

    /// Pass True to exclude gifts that can be purchased a limited number of times and can't be upgraded to unique
    public let excludeLimitedNonUpgradable: Bool?

    /// Pass True to exclude gifts that were assigned from the TON blockchain and can't be resold or transferred in Telegram
    public let excludeFromBlockchain: Bool?

    /// Pass True to exclude unique gifts
    public let excludeUnique: Bool?

    /// Pass True to sort results by gift price instead of send date. Sorting is applied before pagination.
    public let sortByPrice: Bool?

    /// Offset of the first entry to return as received from the previous request; use an empty string to get the first chunk of results
    public let offset: String?

    /// The maximum number of gifts to be returned; 1-100. Defaults to 100
    public let limit: Int?

    /// Custom keys for coding/decoding `GetChatGiftsParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case excludeUnsaved = "exclude_unsaved"
            case excludeSaved = "exclude_saved"
            case excludeUnlimited = "exclude_unlimited"
            case excludeLimitedUpgradable = "exclude_limited_upgradable"
            case excludeLimitedNonUpgradable = "exclude_limited_non_upgradable"
            case excludeFromBlockchain = "exclude_from_blockchain"
            case excludeUnique = "exclude_unique"
            case sortByPrice = "sort_by_price"
            case offset = "offset"
            case limit = "limit"
    }

    public init(chatId: TGChatId, excludeUnsaved: Bool? = nil, excludeSaved: Bool? = nil, excludeUnlimited: Bool? = nil, excludeLimitedUpgradable: Bool? = nil, excludeLimitedNonUpgradable: Bool? = nil, excludeFromBlockchain: Bool? = nil, excludeUnique: Bool? = nil, sortByPrice: Bool? = nil, offset: String? = nil, limit: Int? = nil) {
            self.chatId = chatId
            self.excludeUnsaved = excludeUnsaved
            self.excludeSaved = excludeSaved
            self.excludeUnlimited = excludeUnlimited
            self.excludeLimitedUpgradable = excludeLimitedUpgradable
            self.excludeLimitedNonUpgradable = excludeLimitedNonUpgradable
            self.excludeFromBlockchain = excludeFromBlockchain
            self.excludeUnique = excludeUnique
            self.sortByPrice = sortByPrice
            self.offset = offset
            self.limit = limit
    }
}


public extension TGBot {

/**
 Returns the gifts owned by a chat. Returns OwnedGifts on success.

 SeeAlso Telegram Bot API Reference:
 [GetChatGiftsParams](https://core.telegram.org/bots/api#getchatgifts)
 
 - Parameters:
     - params: Parameters container, see `GetChatGiftsParams` struct
 - Throws: Throws on errors
 - Returns: `TGOwnedGifts`
 */

    @discardableResult
    func getChatGifts(params: TGGetChatGiftsParams) async throws -> TGOwnedGifts {
        guard let methodURL: URL = .init(string: getMethodURL("getChatGifts")) else {
            throw BotError("Bad URL: \(getMethodURL("getChatGifts"))")
        }
        let result: TGOwnedGifts = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
