// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Removes the profile photo of the bot. Requires no parameters. Returns True on success.



public extension TGBot {
/**
 Removes the profile photo of the bot. Requires no parameters. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RemoveMyProfilePhotoParams](https://core.telegram.org/bots/api#removemyprofilephoto)
 
 - Parameters:
     - params: Parameters container, see `RemoveMyProfilePhotoParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func removeMyProfilePhoto() async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("removeMyProfilePhoto")) else {
            throw BotError("Bad URL: \(getMethodURL("removeMyProfilePhoto"))")
        }
        let result: Bool = try await tgClient.post(methodURL)
        return result
    }
}
