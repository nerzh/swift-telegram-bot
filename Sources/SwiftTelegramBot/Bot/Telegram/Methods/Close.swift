// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to close the bot instance before moving it from one local server to another. You need to delete the webhook before calling this method to ensure that the bot isn't launched again after server restart. The method will return error 429 in the first 10 minutes after the bot is launched. Returns True on success. Requires no parameters.



public extension TGBot {
/**
 Use this method to close the bot instance before moving it from one local server to another. You need to delete the webhook before calling this method to ensure that the bot isn't launched again after server restart. The method will return error 429 in the first 10 minutes after the bot is launched. Returns True on success. Requires no parameters.

 SeeAlso Telegram Bot API Reference:
 [CloseParams](https://core.telegram.org/bots/api#close)
 
 - Parameters:
     - params: Parameters container, see `CloseParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func close() async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("close")) else {
            throw BotError("Bad URL: \(getMethodURL("close"))")
        }
        let result: Bool = try await tgClient.post(methodURL)
        return result
    }
}
