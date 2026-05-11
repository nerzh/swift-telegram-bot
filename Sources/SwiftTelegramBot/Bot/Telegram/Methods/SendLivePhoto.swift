// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send live photos. On success, the sent Message is returned.


/// Parameters container struct for `sendLivePhoto` method
public struct TGSendLivePhotoParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of a forum; for forum supergroups and private chats of bots with forum topic mode enabled only
    public let messageThreadId: Int?

    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    public let directMessagesTopicId: Int?

    /// Live photo video to send. The video must be no longer than 10 seconds and must not exceed 10 MB in size. Pass a file_id as String to send a video that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    public let livePhoto: TGFileInfo

    /// The static photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More information on Sending Files ». Sending live photos by a URL is currently unsupported.
    public let photo: TGFileInfo

    /// Video caption (may also be used when resending videos by file_id), 0-1024 characters after entities parsing
    public let caption: String?

    /// Mode for parsing entities in the video caption. See formatting options for more details.
    public let parseMode: TGParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public let captionEntities: [TGMessageEntity]?

    /// Pass True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Pass True if the video needs to be covered with a spoiler animation
    public let hasSpoiler: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public let protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance.
    public let allowPaidBroadcast: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public let messageEffectId: String?

    /// A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    public let suggestedPostParameters: TGSuggestedPostParameters?

    /// Description of the message to reply to
    public let replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user.
    public let replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendLivePhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case directMessagesTopicId = "direct_messages_topic_id"
            case livePhoto = "live_photo"
            case photo = "photo"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case showCaptionAboveMedia = "show_caption_above_media"
            case hasSpoiler = "has_spoiler"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case suggestedPostParameters = "suggested_post_parameters"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, directMessagesTopicId: Int? = nil, livePhoto: TGFileInfo, photo: TGFileInfo, caption: String? = nil, parseMode: TGParseMode? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, hasSpoiler: Bool? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, suggestedPostParameters: TGSuggestedPostParameters? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.directMessagesTopicId = directMessagesTopicId
            self.livePhoto = livePhoto
            self.photo = photo
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.showCaptionAboveMedia = showCaptionAboveMedia
            self.hasSpoiler = hasSpoiler
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.allowPaidBroadcast = allowPaidBroadcast
            self.messageEffectId = messageEffectId
            self.suggestedPostParameters = suggestedPostParameters
            self.replyParameters = replyParameters
            self.replyMarkup = replyMarkup
    }
}


public extension TGBot {

/**
 Use this method to send live photos. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendLivePhotoParams](https://core.telegram.org/bots/api#sendlivephoto)
 
 - Parameters:
     - params: Parameters container, see `SendLivePhotoParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendLivePhoto(params: TGSendLivePhotoParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendLivePhoto")) else {
            throw BotError("Bad URL: \(getMethodURL("sendLivePhoto"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
