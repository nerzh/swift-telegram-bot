// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to add a new sticker to a set created by the bot. You must use exactly one of the fields png_sticker, tgs_sticker, or webm_sticker. Animated stickers can be added to animated sticker sets and only to them. Animated sticker sets can have up to 50 stickers. Static sticker sets can have up to 120 stickers. Returns True on success.


/// Parameters container struct for `addStickerToSet` method
public struct TGAddStickerToSetParams: Encodable {

    /// User identifier of sticker set owner
    public var userId: Int64

    /// Sticker set name
    public var name: String

    /// PNG image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    public var pngSticker: TGFileInfo?

    /// TGS animation with the sticker, uploaded using multipart/form-data. See https://core.telegram.org/stickers#animated-sticker-requirements for technical requirements
    public var tgsSticker: TGInputFile?

    /// WEBM video with the sticker, uploaded using multipart/form-data. See https://core.telegram.org/stickers#video-sticker-requirements for technical requirements
    public var webmSticker: TGInputFile?

    /// One or more emoji corresponding to the sticker
    public var emojis: String

    /// A JSON-serialized object for position where the mask should be placed on faces
    public var maskPosition: TGMaskPosition?

    /// Custom keys for coding/decoding `AddStickerToSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case name = "name"
            case pngSticker = "png_sticker"
            case tgsSticker = "tgs_sticker"
            case webmSticker = "webm_sticker"
            case emojis = "emojis"
            case maskPosition = "mask_position"
    }

    public init(userId: Int64, name: String, pngSticker: TGFileInfo? = nil, tgsSticker: TGInputFile? = nil, webmSticker: TGInputFile? = nil, emojis: String, maskPosition: TGMaskPosition? = nil) {
            self.userId = userId
            self.name = name
            self.pngSticker = pngSticker
            self.tgsSticker = tgsSticker
            self.webmSticker = webmSticker
            self.emojis = emojis
            self.maskPosition = maskPosition
    }
}


public extension TGBot {

/**
 Use this method to add a new sticker to a set created by the bot. You must use exactly one of the fields png_sticker, tgs_sticker, or webm_sticker. Animated stickers can be added to animated sticker sets and only to them. Animated sticker sets can have up to 50 stickers. Static sticker sets can have up to 120 stickers. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [AddStickerToSetParams](https://core.telegram.org/bots/api#addstickertoset)
 
 - Parameters:
     - params: Parameters container, see `AddStickerToSetParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func addStickerToSet(params: TGAddStickerToSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("addStickerToSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
