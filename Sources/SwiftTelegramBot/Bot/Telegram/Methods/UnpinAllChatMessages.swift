// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to clear the list of pinned messages in a chat. In private chats and channel direct messages chats, no additional rights are required to unpin all pinned messages. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin all pinned messages in groups and channels respectively. Returns True on success.


/// Parameters container struct for `unpinAllChatMessages` method
public struct TGUnpinAllChatMessagesParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Custom keys for coding/decoding `UnpinAllChatMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
    }

    public init(chatId: TGChatId) {
            self.chatId = chatId
    }
}


public extension TGBot {

/**
 Use this method to clear the list of pinned messages in a chat. In private chats and channel direct messages chats, no additional rights are required to unpin all pinned messages. Conversely, the bot must be an administrator with the 'can_pin_messages' right or the 'can_edit_messages' right to unpin all pinned messages in groups and channels respectively. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [UnpinAllChatMessagesParams](https://core.telegram.org/bots/api#unpinallchatmessages)
 
 - Parameters:
     - params: Parameters container, see `UnpinAllChatMessagesParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func unpinAllChatMessages(params: TGUnpinAllChatMessagesParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("unpinAllChatMessages")) else {
            throw BotError("Bad URL: \(getMethodURL("unpinAllChatMessages"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
