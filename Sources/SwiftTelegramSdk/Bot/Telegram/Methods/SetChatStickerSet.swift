// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.


/// Parameters container struct for `setChatStickerSet` method
public struct TGSetChatStickerSetParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public let chatId: TGChatId

    /// Name of the sticker set to be set as the group sticker set
    public let stickerSetName: String

    /// Custom keys for coding/decoding `SetChatStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case stickerSetName = "sticker_set_name"
    }

    public init(chatId: TGChatId, stickerSetName: String) {
            self.chatId = chatId
            self.stickerSetName = stickerSetName
    }
}


public extension TGBot {

/**
 Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatStickerSetParams](https://core.telegram.org/bots/api#setchatstickerset)
 
 - Parameters:
     - params: Parameters container, see `SetChatStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatStickerSet(params: TGSetChatStickerSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatStickerSet")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatStickerSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
