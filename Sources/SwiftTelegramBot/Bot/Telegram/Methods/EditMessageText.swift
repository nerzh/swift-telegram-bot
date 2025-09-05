// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit text and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.


/// Parameters container struct for `editMessageText` method
public struct TGEditMessageTextParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message to be edited was sent
    public let businessConnectionId: String?

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public let messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public let inlineMessageId: String?

    /// New text of the message, 1-4096 characters after entities parsing
    public let text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public let entities: [TGMessageEntity]?

    /// Link preview generation options for the message
    public let linkPreviewOptions: TGLinkPreviewOptions?

    /// A JSON-serialized object for an inline keyboard.
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageTextParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
            case linkPreviewOptions = "link_preview_options"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, text: String, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil, linkPreviewOptions: TGLinkPreviewOptions? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
            self.linkPreviewOptions = linkPreviewOptions
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit text and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned. Note that business messages that were not sent by the bot and do not contain an inline keyboard can only be edited within 48 hours from the time they were sent.

 SeeAlso Telegram Bot API Reference:
 [EditMessageTextParams](https://core.telegram.org/bots/api#editmessagetext)
 
 - Parameters:
     - params: Parameters container, see `EditMessageTextParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func editMessageText(params: TGEditMessageTextParams) async throws -> TGMessageOrBool {
        guard let methodURL: URL = .init(string: getMethodURL("editMessageText")) else {
            throw BotError("Bad URL: \(getMethodURL("editMessageText"))")
        }
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
