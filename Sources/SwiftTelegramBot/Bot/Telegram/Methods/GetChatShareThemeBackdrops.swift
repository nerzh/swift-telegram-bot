// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the list of backdrops, which can be used as the background of a theme of the screen for sharing a link to a user or a chat. Requires no parameters. Returns a ChatShareThemeBackdrops object.



public extension TGBot {
/**
 Use this method to get the list of backdrops, which can be used as the background of a theme of the screen for sharing a link to a user or a chat. Requires no parameters. Returns a ChatShareThemeBackdrops object.

 SeeAlso Telegram Bot API Reference:
 [GetChatShareThemeBackdropsParams](https://core.telegram.org/bots/api#getchatsharethemebackdrops)
 
 - Parameters:
     - params: Parameters container, see `GetChatShareThemeBackdropsParams` struct
 - Throws: Throws on errors
 - Returns: `TGChatShareThemeBackdrops`
 */

    @discardableResult
    func getChatShareThemeBackdrops() async throws -> TGChatShareThemeBackdrops {
        guard let methodURL: URL = .init(string: getMethodURL("getChatShareThemeBackdrops")) else {
            throw BotError("Bad URL: \(getMethodURL("getChatShareThemeBackdrops"))")
        }
        let result: TGChatShareThemeBackdrops = try await tgClient.post(methodURL)
        return result
    }
}
