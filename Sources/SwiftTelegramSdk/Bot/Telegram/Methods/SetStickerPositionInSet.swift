// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.


/// Parameters container struct for `setStickerPositionInSet` method
public struct TGSetStickerPositionInSetParams: Encodable, Sendable {

    /// File identifier of the sticker
    public let sticker: String

    /// New sticker position in the set, zero-based
    public let position: Int

    /// Custom keys for coding/decoding `SetStickerPositionInSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
            case position = "position"
    }

    public init(sticker: String, position: Int) {
            self.sticker = sticker
            self.position = position
    }
}


public extension TGBot {

/**
 Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerPositionInSetParams](https://core.telegram.org/bots/api#setstickerpositioninset)
 
 - Parameters:
     - params: Parameters container, see `SetStickerPositionInSetParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setStickerPositionInSet(params: TGSetStickerPositionInSetParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setStickerPositionInSet")) else {
            throw BotError("Bad URL: \(getMethodURL("setStickerPositionInSet"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
