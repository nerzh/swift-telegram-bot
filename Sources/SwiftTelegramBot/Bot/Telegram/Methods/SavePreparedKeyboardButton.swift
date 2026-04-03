// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Stores a keyboard button that can be used by a user within a Mini App. Returns a PreparedKeyboardButton object.


/// Parameters container struct for `savePreparedKeyboardButton` method
public struct TGSavePreparedKeyboardButtonParams: Encodable, Sendable {

    /// Unique identifier of the target user that can use the button
    public let userId: Int64

    /// A JSON-serialized object describing the button to be saved. The button must be of the type request_users, request_chat, or request_managed_bot
    public let button: TGKeyboardButton

    /// Custom keys for coding/decoding `SavePreparedKeyboardButtonParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case button = "button"
    }

    public init(userId: Int64, button: TGKeyboardButton) {
            self.userId = userId
            self.button = button
    }
}


public extension TGBot {

/**
 Stores a keyboard button that can be used by a user within a Mini App. Returns a PreparedKeyboardButton object.

 SeeAlso Telegram Bot API Reference:
 [SavePreparedKeyboardButtonParams](https://core.telegram.org/bots/api#savepreparedkeyboardbutton)
 
 - Parameters:
     - params: Parameters container, see `SavePreparedKeyboardButtonParams` struct
 - Throws: Throws on errors
 - Returns: `TGPreparedKeyboardButton`
 */

    @discardableResult
    func savePreparedKeyboardButton(params: TGSavePreparedKeyboardButtonParams) async throws -> TGPreparedKeyboardButton {
        guard let methodURL: URL = .init(string: getMethodURL("savePreparedKeyboardButton")) else {
            throw BotError("Bad URL: \(getMethodURL("savePreparedKeyboardButton"))")
        }
        let result: TGPreparedKeyboardButton = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
