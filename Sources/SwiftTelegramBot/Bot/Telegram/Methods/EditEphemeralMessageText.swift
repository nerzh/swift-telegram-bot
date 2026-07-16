// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit an ephemeral text message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.


/// Parameters container struct for `editEphemeralMessageText` method
public struct TGEditEphemeralMessageTextParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Identifier of the user who received the message
    public let receiverUserId: Int64

    /// Identifier of the ephemeral message to edit
    public let ephemeralMessageId: Int

    /// New text of the message, 1-4096 characters after entity parsing
    public let text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public let entities: [TGMessageEntity]?

    /// Link preview generation options for the message
    public let linkPreviewOptions: TGLinkPreviewOptions?

    /// A JSON-serialized object for an inline keyboard
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditEphemeralMessageTextParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case receiverUserId = "receiver_user_id"
            case ephemeralMessageId = "ephemeral_message_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
            case linkPreviewOptions = "link_preview_options"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, receiverUserId: Int64, ephemeralMessageId: Int, text: String, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil, linkPreviewOptions: TGLinkPreviewOptions? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.receiverUserId = receiverUserId
            self.ephemeralMessageId = ephemeralMessageId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
            self.linkPreviewOptions = linkPreviewOptions
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit an ephemeral text message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditEphemeralMessageTextParams](https://core.telegram.org/bots/api#editephemeralmessagetext)
 
 - Parameters:
     - params: Parameters container, see `EditEphemeralMessageTextParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editEphemeralMessageText(params: TGEditEphemeralMessageTextParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editEphemeralMessageText")) else {
            throw BotError("Bad URL: \(getMethodURL("editEphemeralMessageText"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
