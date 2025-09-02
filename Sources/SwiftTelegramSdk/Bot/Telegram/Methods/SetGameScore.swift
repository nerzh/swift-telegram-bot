// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.


/// Parameters container struct for `setGameScore` method
public struct TGSetGameScoreParams: Encodable, Sendable {

    /// User identifier
    public let userId: Int64

    /// New score, must be non-negative
    public let score: Int

    /// Pass True if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
    public let force: Bool?

    /// Pass True if the game message should not be automatically edited to include the current scoreboard
    public let disableEditMessage: Bool?

    /// Required if inline_message_id is not specified. Unique identifier for the target chat
    public let chatId: Int64?

    /// Required if inline_message_id is not specified. Identifier of the sent message
    public let messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public let inlineMessageId: String?

    /// Custom keys for coding/decoding `SetGameScoreParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case score = "score"
            case force = "force"
            case disableEditMessage = "disable_edit_message"
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
    }

    public init(userId: Int64, score: Int, force: Bool? = nil, disableEditMessage: Bool? = nil, chatId: Int64? = nil, messageId: Int? = nil, inlineMessageId: String? = nil) {
            self.userId = userId
            self.score = score
            self.force = force
            self.disableEditMessage = disableEditMessage
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
    }
}


public extension TGBot {

/**
 Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.

 SeeAlso Telegram Bot API Reference:
 [SetGameScoreParams](https://core.telegram.org/bots/api#setgamescore)
 
 - Parameters:
     - params: Parameters container, see `SetGameScoreParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessageOrBool`
 */

    @discardableResult
    func setGameScore(params: TGSetGameScoreParams) async throws -> TGMessageOrBool {
        guard let methodURL: URL = .init(string: getMethodURL("setGameScore")) else {
            throw BotError("Bad URL: \(getMethodURL("setGameScore"))")
        }
        let result: TGMessageOrBool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
