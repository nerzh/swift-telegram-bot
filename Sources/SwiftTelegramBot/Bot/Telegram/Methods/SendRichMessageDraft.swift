// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to stream a partial rich message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendRichMessage with the complete message to persist it in the user's chat. Returns True on success.


/// Parameters container struct for `sendRichMessageDraft` method
public struct TGSendRichMessageDraftParams: Encodable, Sendable {

    /// Unique identifier for the target private chat
    public let chatId: Int64

    /// Unique identifier for the target message thread
    public let messageThreadId: Int?

    /// Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated. Otherwise, the draft is replaced without animation.
    public let draftId: Int

    /// The partial message to be streamed. Direct upload of new files and explicit upload of files by a URL isn't supported.
    public let richMessage: TGInputRichMessage

    /// Pass True to show the user a button to stop further drafts. The bot will receive an Update “stopped_message_generation” if the user presses the button.
    public let canStop: Bool?

    /// Pass True to keep the draft in the chat when the button is pressed. The draft will still disappear after a short time or if the bot sends a message. To fully preserve the partial draft, the bot should send it as a new message.
    public let keepOnStop: Bool?

    /// Custom keys for coding/decoding `SendRichMessageDraftParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case draftId = "draft_id"
            case richMessage = "rich_message"
            case canStop = "can_stop"
            case keepOnStop = "keep_on_stop"
    }

    public init(chatId: Int64, messageThreadId: Int? = nil, draftId: Int, richMessage: TGInputRichMessage, canStop: Bool? = nil, keepOnStop: Bool? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.draftId = draftId
            self.richMessage = richMessage
            self.canStop = canStop
            self.keepOnStop = keepOnStop
    }
}


public extension TGBot {

/**
 Use this method to stream a partial rich message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendRichMessage with the complete message to persist it in the user's chat. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SendRichMessageDraftParams](https://core.telegram.org/bots/api#sendrichmessagedraft)
 
 - Parameters:
     - params: Parameters container, see `SendRichMessageDraftParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func sendRichMessageDraft(params: TGSendRichMessageDraftParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("sendRichMessageDraft")) else {
            throw BotError("Bad URL: \(getMethodURL("sendRichMessageDraft"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
