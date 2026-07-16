// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to edit the media of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.


/// Parameters container struct for `editEphemeralMessageMedia` method
public struct TGEditEphemeralMessageMediaParams: Encodable, Sendable {

    /// Unique identifier for the target chat or username of the target supergroup in the format @username
    public let chatId: TGChatId

    /// Identifier of the user who received the message
    public let receiverUserId: Int64

    /// Identifier of the ephemeral message to edit
    public let ephemeralMessageId: Int

    /// A JSON-serialized object for the new media content of the message. A new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL.
    public let media: TGInputMedia

    /// A JSON-serialized object for an inline keyboard
    public let replyMarkup: TGInlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditEphemeralMessageMediaParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case receiverUserId = "receiver_user_id"
            case ephemeralMessageId = "ephemeral_message_id"
            case media = "media"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: TGChatId, receiverUserId: Int64, ephemeralMessageId: Int, media: TGInputMedia, replyMarkup: TGInlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.receiverUserId = receiverUserId
            self.ephemeralMessageId = ephemeralMessageId
            self.media = media
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to edit the media of an ephemeral message. Note that it is not guaranteed that the user will receive the message edit event, especially if they are offline. On success, True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditEphemeralMessageMediaParams](https://core.telegram.org/bots/api#editephemeralmessagemedia)
 
 - Parameters:
     - params: Parameters container, see `EditEphemeralMessageMediaParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func editEphemeralMessageMedia(params: TGEditEphemeralMessageMediaParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("editEphemeralMessageMedia")) else {
            throw BotError("Bad URL: \(getMethodURL("editEphemeralMessageMedia"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
