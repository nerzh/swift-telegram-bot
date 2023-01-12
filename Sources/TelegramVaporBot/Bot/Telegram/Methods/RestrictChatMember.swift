// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

/// DESCRIPTION:
/// Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.


/// Parameters container struct for `restrictChatMember` method
public struct TGRestrictChatMemberParams: Encodable {

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: TGChatId

    /// Unique identifier of the target user
    public var userId: Int64

    /// A JSON-serialized object for new user permissions
    public var permissions: TGChatPermissions

    /// Date when restrictions will be lifted for the user, unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever
    public var untilDate: Int?

    /// Custom keys for coding/decoding `RestrictChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case userId = "user_id"
            case permissions = "permissions"
            case untilDate = "until_date"
    }

    public init(chatId: TGChatId, userId: Int64, permissions: TGChatPermissions, untilDate: Int? = nil) {
            self.chatId = chatId
            self.userId = userId
            self.permissions = permissions
            self.untilDate = untilDate
    }
}


public extension TGBot {

/**
 Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.

 SeeAlso Telegram Bot API Reference:
 [RestrictChatMemberParams](https://core.telegram.org/bots/api#restrictchatmember)
 
 - Parameters:
     - params: Parameters container, see `RestrictChatMemberParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Bool` type
 */
    @discardableResult
    func restrictChatMember(params: TGRestrictChatMemberParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("restrictChatMember"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
