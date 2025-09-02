// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.


/// Parameters container struct for `deleteChatStickerSet` method
public struct TGDeleteChatStickerSetParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public let chatId: TGChatId

    /// Custom keys for coding/decoding `DeleteChatStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteChatStickerSetParams](https://core.telegram.org/bots/api#deletechatstickerset)
 
 - Parameters:
     - params: Parameters container, see `DeleteChatStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteChatStickerSet(params: TGDeleteChatStickerSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteChatStickerSet")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteChatStickerSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
