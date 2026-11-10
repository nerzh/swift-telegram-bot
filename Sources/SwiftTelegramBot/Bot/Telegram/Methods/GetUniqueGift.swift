// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get information about a unique gift by its name. Returns a UniqueGift object on success.


/// Parameters container struct for `getUniqueGift` method
public struct TGGetUniqueGiftParams: Encodable, Sendable {

    /// Unique name of the gift
    public let name: String

    /// Custom keys for coding/decoding `GetUniqueGiftParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
    }

    public init(name: String) {
            self.name = name
    }
}


public extension TGBot {

/**
 Use this method to get information about a unique gift by its name. Returns a UniqueGift object on success.

 SeeAlso Telegram Bot API Reference:
 [GetUniqueGiftParams](https://core.telegram.org/bots/api#getuniquegift)
 
 - Parameters:
     - params: Parameters container, see `GetUniqueGiftParams` struct
 - Throws: Throws on errors
 - Returns: `TGUniqueGift`
 */

    @discardableResult
    func getUniqueGift(params: TGGetUniqueGiftParams) async throws -> TGUniqueGift {
        guard let methodURL: URL = .init(string: getMethodURL("getUniqueGift")) else {
            throw BotError("Bad URL: \(getMethodURL("getUniqueGift"))")
        }
        let result: TGUniqueGift = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
