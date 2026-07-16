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

    /// Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated.
    public let draftId: Int

    /// The partial message to be streamed. Direct upload of new files isn't supported.
    public let richMessage: TGInputRichMessage

    /// Custom keys for coding/decoding `SendRichMessageDraftParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case draftId = "draft_id"
            case richMessage = "rich_message"
    }

    public init(chatId: Int64, messageThreadId: Int? = nil, draftId: Int, richMessage: TGInputRichMessage) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.draftId = draftId
            self.richMessage = richMessage
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
