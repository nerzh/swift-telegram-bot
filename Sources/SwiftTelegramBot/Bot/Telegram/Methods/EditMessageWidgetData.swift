// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit data of a widget in a message sent by the bot or via the bot (for inline bots). Public data of a shared widget can be changed at most once per second. On success, True is returned.


/// Parameters container struct for `editMessageWidgetData` method
public struct TGEditMessageWidgetDataParams: Encodable, Sendable {

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target supergroup in the format @username.
    public let chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message with the widget.
    public let messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message.
    public let inlineMessageId: String?

    /// New public data of the widget, 0-1024 bytes; pass an empty string to remove the public data. If omitted, then the public data isn't changed.
    public let publicData: String?

    /// New data of the widget, which is specific to the message, 0-1024 bytes; pass an empty string to remove the data. If omitted, then the data isn't changed.
    public let chatData: String?

    /// Custom keys for coding/decoding `EditMessageWidgetDataParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case publicData = "public_data"
            case chatData = "chat_data"
    }

    public init(chatId: TGChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, publicData: String? = nil, chatData: String? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.publicData = publicData
            self.chatData = chatData
    }
}


public extension TGBot {

/**
 Use this method to edit data of a widget in a message sent by the bot or via the bot (for inline bots). Public data of a shared widget can be changed at most once per second. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditMessageWidgetDataParams](https://core.telegram.org/bots/api#editmessagewidgetdata)
 
 - Parameters:
     - params: Parameters container, see `EditMessageWidgetDataParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editMessageWidgetData(params: TGEditMessageWidgetDataParams? = nil) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editMessageWidgetData")) else {
            throw BotError("Bad URL: \(getMethodURL("editMessageWidgetData"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
