// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to stream a partial message to a user while the message is being generated. Returns True on success.


/// Parameters container struct for `sendMessageDraft` method
public struct TGSendMessageDraftParams: Encodable, Sendable {

    /// Unique identifier for the target private chat
    public let chatId: Int64

    /// Unique identifier for the target message thread
    public let messageThreadId: Int?

    /// Unique identifier of the message draft; must be non-zero. Changes of drafts with the same identifier are animated
    public let draftId: Int

    /// Text of the message to be sent, 1-4096 characters after entities parsing
    public let text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
    public let entities: [TGMessageEntity]?

    /// Custom keys for coding/decoding `SendMessageDraftParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case draftId = "draft_id"
            case text = "text"
            case parseMode = "parse_mode"
            case entities = "entities"
    }

    public init(chatId: Int64, messageThreadId: Int? = nil, draftId: Int, text: String, parseMode: TGParseMode? = nil, entities: [TGMessageEntity]? = nil) {
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.draftId = draftId
            self.text = text
            self.parseMode = parseMode
            self.entities = entities
    }
}


public extension TGBot {

/**
 Use this method to stream a partial message to a user while the message is being generated. Returns True on success.

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
