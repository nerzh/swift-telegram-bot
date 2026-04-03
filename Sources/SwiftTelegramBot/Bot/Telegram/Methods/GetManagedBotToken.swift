// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the token of a managed bot. Returns the token as String on success.


/// Parameters container struct for `getManagedBotToken` method
public struct TGGetManagedBotTokenParams: Encodable, Sendable {

    /// User identifier of the managed bot whose token will be returned
    public let userId: Int64

    /// Custom keys for coding/decoding `GetManagedBotTokenParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
    }

    public init(userId: Int64) {
            self.userId = userId
    }
}


public extension TGBot {

/**
 Use this method to get the token of a managed bot. Returns the token as String on success.

 SeeAlso Telegram Bot API Reference:
 [GetManagedBotTokenParams](https://core.telegram.org/bots/api#getmanagedbottoken)
 
 - Parameters:
     - params: Parameters container, see `GetManagedBotTokenParams` struct
 - Throws: Throws on errors
 - Returns: `String`
 */

    @discardableResult
    func getManagedBotToken(params: TGGetManagedBotTokenParams) async throws -> String {
        guard let methodURL: URL = .init(string: getMethodURL("getManagedBotToken")) else {
            throw BotError("Bad URL: \(getMethodURL("getManagedBotToken"))")
        }
        let result: String = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
