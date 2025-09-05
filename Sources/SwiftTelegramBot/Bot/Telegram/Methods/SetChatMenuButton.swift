// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success.


/// Parameters container struct for `setChatMenuButton` method
public struct TGSetChatMenuButtonParams: Encodable, Sendable {

    /// Unique identifier for the target private chat. If not specified, default bot's menu button will be changed
    public let chatId: Int64?

    /// A JSON-serialized object for the bot's new menu button. Defaults to MenuButtonDefault
    public let menuButton: TGMenuButton?

    /// Custom keys for coding/decoding `SetChatMenuButtonParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case menuButton = "menu_button"
    }

    public init(chatId: Int64? = nil, menuButton: TGMenuButton? = nil) {
            self.chatId = chatId
            self.menuButton = menuButton
    }
}


public extension TGBot {

/**
 Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatMenuButtonParams](https://core.telegram.org/bots/api#setchatmenubutton)
 
 - Parameters:
     - params: Parameters container, see `SetChatMenuButtonParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setChatMenuButton(params: TGSetChatMenuButtonParams? = nil) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setChatMenuButton")) else {
            throw BotError("Bad URL: \(getMethodURL("setChatMenuButton"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
