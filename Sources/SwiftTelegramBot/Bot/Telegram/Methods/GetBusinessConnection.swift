// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success.


/// Parameters container struct for `getBusinessConnection` method
public struct TGGetBusinessConnectionParams: Encodable, Sendable {

    /// Unique identifier of the business connection
    public let businessConnectionId: String

    /// Custom keys for coding/decoding `GetBusinessConnectionParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
    }

    public init(businessConnectionId: String) {
            self.businessConnectionId = businessConnectionId
    }
}


public extension TGBot {

/**
 Use this method to get information about the connection of the bot with a business account. Returns a BusinessConnection object on success.

 SeeAlso Telegram Bot API Reference:
 [GetBusinessConnectionParams](https://core.telegram.org/bots/api#getbusinessconnection)
 
 - Parameters:
     - params: Parameters container, see `GetBusinessConnectionParams` struct
 - Throws: Throws on errors
 - Returns: `TGBusinessConnection`
 */

    @discardableResult
    func getBusinessConnection(params: TGGetBusinessConnectionParams) async throws -> TGBusinessConnection {
        guard let methodURL: URL = .init(string: getMethodURL("getBusinessConnection")) else {
            throw BotError("Bad URL: \(getMethodURL("getBusinessConnection"))")
        }
        let result: TGBusinessConnection = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
