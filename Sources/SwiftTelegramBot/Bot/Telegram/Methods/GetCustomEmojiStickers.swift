// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.


/// Parameters container struct for `getCustomEmojiStickers` method
public struct TGGetCustomEmojiStickersParams: Encodable, Sendable {

    /// A JSON-serialized list of custom emoji identifiers. At most 200 custom emoji identifiers can be specified.
    public let customEmojiIds: [String]

    /// Custom keys for coding/decoding `GetCustomEmojiStickersParams` struct
    public enum CodingKeys: String, CodingKey {
            case customEmojiIds = "custom_emoji_ids"
    }

    public init(customEmojiIds: [String]) {
            self.customEmojiIds = customEmojiIds
    }
}


public extension TGBot {

/**
 Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.

 SeeAlso Telegram Bot API Reference:
 [GetCustomEmojiStickersParams](https://core.telegram.org/bots/api#getcustomemojistickers)
 
 - Parameters:
     - params: Parameters container, see `GetCustomEmojiStickersParams` struct
 - Throws: Throws on errors
 - Returns: `[TGSticker]`
 */

    @discardableResult
    func getCustomEmojiStickers(params: TGGetCustomEmojiStickersParams) async throws -> [TGSticker] {
        guard let methodURL: URL = .init(string: getMethodURL("getCustomEmojiStickers")) else {
            throw BotError("Bad URL: \(getMethodURL("getCustomEmojiStickers"))")
        }
        let result: [TGSticker] = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
