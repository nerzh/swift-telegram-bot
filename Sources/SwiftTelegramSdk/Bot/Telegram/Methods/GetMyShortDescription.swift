// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success.


/// Parameters container struct for `getMyShortDescription` method
public struct TGGetMyShortDescriptionParams: Encodable, Sendable {

    /// A two-letter ISO 639-1 language code or an empty string
    public let languageCode: String?

    /// Custom keys for coding/decoding `GetMyShortDescriptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case languageCode = "language_code"
    }

    public init(languageCode: String? = nil) {
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success.

 SeeAlso Telegram Bot API Reference:
 [GetMyShortDescriptionParams](https://core.telegram.org/bots/api#getmyshortdescription)
 
 - Parameters:
     - params: Parameters container, see `GetMyShortDescriptionParams` struct
 - Throws: Throws on errors
 - Returns: `TGBotShortDescription`
 */

    @discardableResult
    func getMyShortDescription(params: TGGetMyShortDescriptionParams? = nil) async throws -> TGBotShortDescription {
        guard let methodURL: URL = .init(string: getMethodURL("getMyShortDescription")) else {
            throw BotError("Bad URL: \(getMethodURL("getMyShortDescription"))")
        }
        let result: TGBotShortDescription = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
