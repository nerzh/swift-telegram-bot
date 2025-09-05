// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.


/// Parameters container struct for `exportChatInviteLink` method
public struct TGExportChatInviteLinkParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Custom keys for coding/decoding `ExportChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.

 SeeAlso Telegram Bot API Reference:
 [ExportChatInviteLinkParams](https://core.telegram.org/bots/api#exportchatinvitelink)
 
 - Parameters:
     - params: Parameters container, see `ExportChatInviteLinkParams` struct
 - Throws: Throws on errors
 - Returns: `String`
 */

    @discardableResult
    func exportChatInviteLink(params: TGExportChatInviteLinkParams) async throws -> String {
        guard let methodURL: URL = .init(string: getMethodURL("exportChatInviteLink")) else {
            throw BotError("Bad URL: \(getMethodURL("exportChatInviteLink"))")
        }
        let result: String = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
