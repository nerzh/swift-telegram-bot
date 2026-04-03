// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to revoke the current token of a managed bot and generate a new one. Returns the new token as String on success.


/// Parameters container struct for `replaceManagedBotToken` method
public struct TGReplaceManagedBotTokenParams: Encodable, Sendable {

    /// User identifier of the managed bot whose token will be replaced
    public let userId: Int64

    /// Custom keys for coding/decoding `ReplaceManagedBotTokenParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
    }

    public init(userId: Int64) {
            self.userId = userId
    }
}


public extension TGBot {

/**
 Use this method to revoke the current token of a managed bot and generate a new one. Returns the new token as String on success.

 SeeAlso Telegram Bot API Reference:
 [ReplaceManagedBotTokenParams](https://core.telegram.org/bots/api#replacemanagedbottoken)
 
 - Parameters:
     - params: Parameters container, see `ReplaceManagedBotTokenParams` struct
 - Throws: Throws on errors
 - Returns: `String`
 */

    @discardableResult
    func replaceManagedBotToken(params: TGReplaceManagedBotTokenParams) async throws -> String {
        guard let methodURL: URL = .init(string: getMethodURL("replaceManagedBotToken")) else {
            throw BotError("Bad URL: \(getMethodURL("replaceManagedBotToken"))")
        }
        let result: String = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
