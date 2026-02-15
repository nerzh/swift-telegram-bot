// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Changes the profile photo of the bot. Returns True on success.


/// Parameters container struct for `setMyProfilePhoto` method
public struct TGSetMyProfilePhotoParams: Encodable, Sendable {

    /// The new profile photo to set
    public let photo: TGInputProfilePhoto

    /// Custom keys for coding/decoding `SetMyProfilePhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case photo = "photo"
    }

    public init(photo: TGInputProfilePhoto) {
            self.photo = photo
    }
}


public extension TGBot {

/**
 Changes the profile photo of the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetMyProfilePhotoParams](https://core.telegram.org/bots/api#setmyprofilephoto)
 
 - Parameters:
     - params: Parameters container, see `SetMyProfilePhotoParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setMyProfilePhoto(params: TGSetMyProfilePhotoParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setMyProfilePhoto")) else {
            throw BotError("Bad URL: \(getMethodURL("setMyProfilePhoto"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
