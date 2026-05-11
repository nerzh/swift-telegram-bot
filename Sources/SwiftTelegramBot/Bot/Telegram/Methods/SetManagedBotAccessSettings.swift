// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the access settings of a managed bot. Returns True on success.


/// Parameters container struct for `setManagedBotAccessSettings` method
public struct TGSetManagedBotAccessSettingsParams: Encodable, Sendable {

    /// User identifier of the managed bot whose access settings will be changed
    public let userId: Int64

    /// Pass True, if only selected users can access the bot. The bot's owner can always access it.
    public let isAccessRestricted: Bool

    /// A JSON-serialized list of up to 10 identifiers of users who will have access to the bot in addition to its owner. Ignored if is_access_restricted is false.
    public let addedUserIds: [Int64]?

    /// Custom keys for coding/decoding `SetManagedBotAccessSettingsParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case isAccessRestricted = "is_access_restricted"
            case addedUserIds = "added_user_ids"
    }

    public init(userId: Int64, isAccessRestricted: Bool, addedUserIds: [Int64]? = nil) {
            self.userId = userId
            self.isAccessRestricted = isAccessRestricted
            self.addedUserIds = addedUserIds
    }
}


public extension TGBot {

/**
 Use this method to change the access settings of a managed bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetManagedBotAccessSettingsParams](https://core.telegram.org/bots/api#setmanagedbotaccesssettings)
 
 - Parameters:
     - params: Parameters container, see `SetManagedBotAccessSettingsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setManagedBotAccessSettings(params: TGSetManagedBotAccessSettingsParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setManagedBotAccessSettings")) else {
            throw BotError("Bad URL: \(getMethodURL("setManagedBotAccessSettings"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
