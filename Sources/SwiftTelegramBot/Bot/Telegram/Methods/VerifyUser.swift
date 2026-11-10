// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Verifies a user on behalf of the organization which is represented by the bot. Returns True on success.


/// Parameters container struct for `verifyUser` method
public struct TGVerifyUserParams: Encodable, Sendable {

    /// Unique identifier of the target user
    public let userId: Int64

    /// Custom description for the verification; 0-70 characters. Must be empty if the organization isn't allowed to provide a custom verification description.
    public let customDescription: String?

    /// Mode for parsing entities in the custom description. See formatting options for more details. Only “text_link” entities are supported.
    public let customDescriptionParseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the custom description, which can be specified instead of custom_description_parse_mode. Only “text_link” entities are supported.
    public let customDescriptionEntities: [TGMessageEntity]?

    /// Custom keys for coding/decoding `VerifyUserParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case customDescription = "custom_description"
            case customDescriptionParseMode = "custom_description_parse_mode"
            case customDescriptionEntities = "custom_description_entities"
    }

    public init(userId: Int64, customDescription: String? = nil, customDescriptionParseMode: TGParseMode? = nil, customDescriptionEntities: [TGMessageEntity]? = nil) {
            self.userId = userId
            self.customDescription = customDescription
            self.customDescriptionParseMode = customDescriptionParseMode
            self.customDescriptionEntities = customDescriptionEntities
    }
}


public extension TGBot {

/**
 Verifies a user on behalf of the organization which is represented by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [VerifyUserParams](https://core.telegram.org/bots/api#verifyuser)
 
 - Parameters:
     - params: Parameters container, see `VerifyUserParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func verifyUser(params: TGVerifyUserParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("verifyUser")) else {
            throw BotError("Bad URL: \(getMethodURL("verifyUser"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
