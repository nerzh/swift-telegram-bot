// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success.


/// Parameters container struct for `setStickerMaskPosition` method
public struct TGSetStickerMaskPositionParams: Encodable, Sendable {

    /// File identifier of the sticker
    public let sticker: String

    /// A JSON-serialized object with the position where the mask should be placed on faces. Omit the parameter to remove the mask position.
    public let maskPosition: TGMaskPosition?

    /// Custom keys for coding/decoding `SetStickerMaskPositionParams` struct
    public enum CodingKeys: String, CodingKey {
            case sticker = "sticker"
            case maskPosition = "mask_position"
    }

    public init(sticker: String, maskPosition: TGMaskPosition? = nil) {
            self.sticker = sticker
            self.maskPosition = maskPosition
    }
}


public extension TGBot {

/**
 Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetStickerMaskPositionParams](https://core.telegram.org/bots/api#setstickermaskposition)
 
 - Parameters:
     - params: Parameters container, see `SetStickerMaskPositionParams` struct
 - Throws: Throws on errors
 - Returns: `Bool`
 */

    @discardableResult
    func setStickerMaskPosition(params: TGSetStickerMaskPositionParams) async throws -> Bool {
        guard let methodURL: URL = .init(string: getMethodURL("setStickerMaskPosition")) else {
            throw BotError("Bad URL: \(getMethodURL("setStickerMaskPosition"))")
        }
        let result: Bool = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
