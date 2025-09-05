// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to upload a file with a sticker for later use in the createNewStickerSet, addStickerToSet, or replaceStickerInSet methods (the file can be used multiple times). Returns the uploaded File on success.


/// Parameters container struct for `uploadStickerFile` method
public struct TGUploadStickerFileParams: Encodable, Sendable {

    /// User identifier of sticker file owner
    public let userId: Int64

    /// A file with the sticker in .WEBP, .PNG, .TGS, or .WEBM format. See https://core.telegram.org/stickers for technical requirements. More information on Sending Files »
    public let sticker: TGInputFile

    /// Format of the sticker, must be one of “static”, “animated”, “video”
    public let stickerFormat: String

    /// Custom keys for coding/decoding `UploadStickerFileParams` struct
    public enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case sticker = "sticker"
            case stickerFormat = "sticker_format"
    }

    public init(userId: Int64, sticker: TGInputFile, stickerFormat: String) {
            self.userId = userId
            self.sticker = sticker
            self.stickerFormat = stickerFormat
    }
}


public extension TGBot {

/**
 Use this method to upload a file with a sticker for later use in the createNewStickerSet, addStickerToSet, or replaceStickerInSet methods (the file can be used multiple times). Returns the uploaded File on success.

 SeeAlso Telegram Bot API Reference:
 [UploadStickerFileParams](https://core.telegram.org/bots/api#uploadstickerfile)
 
 - Parameters:
     - params: Parameters container, see `UploadStickerFileParams` struct
 - Throws: Throws on errors
 - Returns: `TGFile`
 */

    @discardableResult
    func uploadStickerFile(params: TGUploadStickerFileParams) async throws -> TGFile {
        guard let methodURL: URL = .init(string: getMethodURL("uploadStickerFile")) else {
            throw BotError("Bad URL: \(getMethodURL("uploadStickerFile"))")
        }
        let result: TGFile = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
