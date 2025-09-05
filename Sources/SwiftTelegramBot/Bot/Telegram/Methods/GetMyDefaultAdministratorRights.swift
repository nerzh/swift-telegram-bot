// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.


/// Parameters container struct for `getMyDefaultAdministratorRights` method
public struct TGGetMyDefaultAdministratorRightsParams: Encodable, Sendable {

    /// Pass True to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned.
    public let forChannels: Bool?

    /// Custom keys for coding/decoding `GetMyDefaultAdministratorRightsParams` struct
    public enum CodingKeys: String, CodingKey {
            case forChannels = "for_channels"
    }

    public init(forChannels: Bool? = nil) {
            self.forChannels = forChannels
    }
}


public extension TGBot {

/**
 Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.

 SeeAlso Telegram Bot API Reference:
 [GetMyDefaultAdministratorRightsParams](https://core.telegram.org/bots/api#getmydefaultadministratorrights)
 
 - Parameters:
     - params: Parameters container, see `GetMyDefaultAdministratorRightsParams` struct
 - Throws: Throws on errors
 - Returns: `TGChatAdministratorRights`
 */

    @discardableResult
    func getMyDefaultAdministratorRights(params: TGGetMyDefaultAdministratorRightsParams? = nil) async throws -> TGChatAdministratorRights {
        guard let methodURL: URL = .init(string: getMethodURL("getMyDefaultAdministratorRights")) else {
            throw BotError("Bad URL: \(getMethodURL("getMyDefaultAdministratorRights"))")
        }
        let result: TGChatAdministratorRights = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
