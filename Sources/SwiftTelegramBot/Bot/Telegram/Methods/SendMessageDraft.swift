// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to stream a partial message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendMessage with the complete message to persist it in the user's chat. Returns True on success.


/// Parameters container struct for `sendMessageDraft` method
public struct TGSendMessageDraftParams: Encodable, Sendable {

    /// Unique identifier for the target private chat
    public let chatId: Int64

    /// Unique identifier for the target message thread
    public let messageThreadId: Int?

    /// Unique identifier of the message draft; must be non-zero. Changes to drafts with the same identifier are animated. Otherwise, the draft is replaced without animation.
    public let draftId: Int

    /// Text of the message to be sent, 0-4096 characters after entities parsing. Pass an empty text to show a “Thinking…” placeholder.
    public let text: String?

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public let entities: [TGMessageEntity]?

    /// Pass True to show the user a button to stop further drafts. The bot will receive an Update “stopped_message_generation” if the user presses the button.
    public let canStop: Bool?

    /// Pass True to keep the draft in the chat when the button is pressed. The draft will still disappear after a short time or if the bot sends a message. To fully preserve the partial draft, the bot should send it as a new message.
    public let keepOnStop: Bool?

    /// Custom keys for coding/decoding `SendMessageDraftParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case draftId = "draft_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
            case canStop = "can_stop"
            case keepOnStop = "keep_on_stop"
    }

    public init(chatId: Int64, messageThreadId: Int? = nil, draftId: Int, text: String? = nil, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil, canStop: Bool? = nil, keepOnStop: Bool? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.draftId = draftId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
            self.canStop = canStop
            self.keepOnStop = keepOnStop
    }
}


public extension TGBot {

/**
 Use this method to stream a partial message to a user while the message is being generated. Note that the streamed draft is ephemeral and acts as a temporary 30-second preview - once the output is finalized, you must call sendMessage with the complete message to persist it in the user's chat. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SendMessageDraftParams](https://core.telegram.org/bots/api#sendmessagedraft)
 
 - Parameters:
     - params: Parameters container, see `SendMessageDraftParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func sendMessageDraft(params: TGSendMessageDraftParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("sendMessageDraft")) else {
            throw BotError("Bad URL: \(getMethodURL("sendMessageDraft"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
