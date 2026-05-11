// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the access settings of a managed bot. Returns a BotAccessSettings object on success.


/// Parameters container struct for `getManagedBotAccessSettings` method
public struct TGGetManagedBotAccessSettingsParams: Encodable, Sendable {

    /// User identifier of the managed bot whose access settings will be returned
    public let userId: Int64

    /// Custom keys for coding/decoding `GetManagedBotAccessSettingsParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
    }

    public init(userId: Int64) {
            self.userId = userId
    }
}


public extension TGBot {

/**
 Use this method to get the access settings of a managed bot. Returns a BotAccessSettings object on success.

 SeeAlso Telegram Bot API Reference:
 [GetManagedBotAccessSettingsParams](https://core.telegram.org/bots/api#getmanagedbotaccesssettings)
 
 - Parameters:
     - params: Parameters container, see `GetManagedBotAccessSettingsParams` struct
 - Throws: Throws on errors
 - Returns: `TGBotAccessSettings`
 */

    @discardableResult
    func getManagedBotAccessSettings(params: TGGetManagedBotAccessSettingsParams) async throws -> TGBotAccessSettings {
        guard let methodURL: URL = .init(string: getMethodURL("getManagedBotAccessSettings")) else {
            throw BotError("Bad URL: \(getMethodURL("getManagedBotAccessSettings"))")
        }
        let result: TGBotAccessSettings = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
