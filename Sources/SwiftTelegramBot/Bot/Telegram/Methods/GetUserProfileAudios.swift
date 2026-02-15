// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get a list of profile audios for a user. Returns a UserProfileAudios object.


/// Parameters container struct for `getUserProfileAudios` method
public struct TGGetUserProfileAudiosParams: Encodable, Sendable {

    /// Unique identifier of the target user
    public let userId: Int64

    /// Sequential number of the first audio to be returned. By default, all audios are returned.
    public let offset: Int?

    /// Limits the number of audios to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    public let limit: Int?

    /// Custom keys for coding/decoding `GetUserProfileAudiosParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case offset = "offset"
            case limit = "limit"
    }

    public init(userId: Int64, offset: Int? = nil, limit: Int? = nil) {
            self.userId = userId
            self.offset = offset
            self.limit = limit
    }
}


public extension TGBot {

/**
 Use this method to get a list of profile audios for a user. Returns a UserProfileAudios object.

 SeeAlso Telegram Bot API Reference:
 [GetUserProfileAudiosParams](https://core.telegram.org/bots/api#getuserprofileaudios)
 
 - Parameters:
     - params: Parameters container, see `GetUserProfileAudiosParams` struct
 - Throws: Throws on errors
 - Returns: `TGUserProfileAudios`
 */

    @discardableResult
    func getUserProfileAudios(params: TGGetUserProfileAudiosParams) async throws -> TGUserProfileAudios {
        guard let methodURL: URL = .init(string: getMethodURL("getUserProfileAudios")) else {
            throw BotError("Bad URL: \(getMethodURL("getUserProfileAudios"))")
        }
        let result: TGUserProfileAudios = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
