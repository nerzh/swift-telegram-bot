// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.


/// Parameters container struct for `deleteMyCommands` method
public struct TGDeleteMyCommandsParams: Encodable, Sendable {

    /// A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    public let scope: TGBotCommandScope?

    /// A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands
    public let languageCode: String?

    /// Custom keys for coding/decoding `DeleteMyCommandsParams` struct
    public enum CodingKeys: String, CodingKey {
            case scope = "scope"
            case languageCode = "language_code"
    }

    public init(scope: TGBotCommandScope? = nil, languageCode: String? = nil) {
            self.scope = scope
            self.languageCode = languageCode
    }
}


public extension TGBot {

/**
 Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [DeleteMyCommandsParams](https://core.telegram.org/bots/api#deletemycommands)
 
 - Parameters:
     - params: Parameters container, see `DeleteMyCommandsParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func deleteMyCommands(params: TGDeleteMyCommandsParams? = nil) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("deleteMyCommands")) else {
            throw BotError("Bad URL: \(getMethodURL("deleteMyCommands"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
