// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.


/// Parameters container struct for `setChatPhoto` method
public struct TGSetChatPhotoParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: TGChatId

    /// New chat photo, uploaded using multipart/form-data
    public var photo: TGInputFile

    /// Custom keys for coding/decoding `SetChatPhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case photo = "photo"
    }

    public init(chatId: TGChatId, photo: TGInputFile) {
            self.chatId = chatId
            self.photo = photo
    }
}


public extension TGBot {

/**
 Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [SetChatPhotoParams](https://core.telegram.org/bots/api#setchatphoto)
 
 - Parameters:
     - params: Parameters container, see `SetChatPhotoParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func setChatPhoto(params: TGSetChatPhotoParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatPhoto"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
