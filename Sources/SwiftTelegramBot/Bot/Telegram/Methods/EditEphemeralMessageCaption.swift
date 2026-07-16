// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit the caption of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.


/// Parameters container struct for `editEphemeralMessageCaption` method
public struct TGEditEphemeralMessageCaptionParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Identifier of the user who received the message
    public let receiverUserId: Int64

    /// Identifier of the ephemeral message to edit
    public let ephemeralMessageId: Int

    /// New caption of the message, 0-1024 characters after entities parsing
    public let caption: String?

    /// Mode for parsing entities in the message caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// A JSON-serialized object for an inline keyboard
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditEphemeralMessageCaptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case receiverUserId = "receiver_user_id"
            case ephemeralMessageId = "ephemeral_message_id"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, receiverUserId: Int64, ephemeralMessageId: Int, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.receiverUserId = receiverUserId
            self.ephemeralMessageId = ephemeralMessageId
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit the caption of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditEphemeralMessageCaptionParams](https://core.telegram.org/bots/api#editephemeralmessagecaption)
 
 - Parameters:
     - params: Parameters container, see `EditEphemeralMessageCaptionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editEphemeralMessageCaption(params: TGEditEphemeralMessageCaptionParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editEphemeralMessageCaption")) else {
            throw BotError("Bad URL: \(getMethodURL("editEphemeralMessageCaption"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
