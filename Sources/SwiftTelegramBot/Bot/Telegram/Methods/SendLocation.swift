// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send point on the map. On success, the sent Message is returned.


/// Parameters container struct for `sendLocation` method
public struct TGSendLocationParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public let messageThreadId: Int?

    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    public let directMessagesTopicId: Int?

    /// Latitude of the location
    public let latitude: Float

    /// Longitude of the location
    public let longitude: Float

    /// The radius of uncertainty for the location, measured in meters; 0-1500
    public let horizontalAccuracy: Float?

    /// Period in seconds during which the location will be updated (see Live Locations, should be between 60 and 86400, or 0x7FFFFFFF for live locations that can be edited indefinitely.
    public let livePeriod: Int?

    /// For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    public let heading: Int?

    /// For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    public let proximityAlertRadius: Int?

    /// Sends the message silently. Users will receive a notification with no sound.
    public let disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public let protectContent: Bool?

    /// Pass True to allow up to 1000 messages per second, ignoring broadcasting limits for a fee of 0.1 Telegram Stars per message. The relevant Stars will be withdrawn from the bot's balance
    public let allowPaidBroadcast: Bool?

    /// Unique identifier of the message effect to be added to the message; for private chats only
    public let messageEffectId: String?

    /// A JSON-serialized object containing the parameters of the suggested post to send; for direct messages chats only. If the message is sent as a reply to another suggested post, then that suggested post is automatically declined.
    public let suggestedPostParameters: TGSuggestedPostParameters?

    /// Description of the message to reply to
    public let replyParameters: TGReplyParameters?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove a reply keyboard or to force a reply from the user
    public let replyMarkup: TGReplyMarkup?

    /// Custom keys for coding/decoding `SendLocationParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case directMessagesTopicId = "direct_messages_topic_id"
            case latitude = "latitude"
            case longitude = "longitude"
            case horizontalAccuracy = "horizontal_accuracy"
            case livePeriod = "live_period"
            case heading = "heading"
            case proximityAlertRadius = "proximity_alert_radius"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case suggestedPostParameters = "suggested_post_parameters"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, directMessagesTopicId: Int? = nil, latitude: Float, longitude: Float, horizontalAccuracy: Float? = nil, livePeriod: Int? = nil, heading: Int? = nil, proximityAlertRadius: Int? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, suggestedPostParameters: TGSuggestedPostParameters? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.directMessagesTopicId = directMessagesTopicId
            self.latitude = latitude
            self.longitude = longitude
            self.horizontalAccuracy = horizontalAccuracy
            self.livePeriod = livePeriod
            self.heading = heading
            self.proximityAlertRadius = proximityAlertRadius
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
 Use this method to send point on the map. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendLocationParams](https://core.telegram.org/bots/api#sendlocation)
 
 - Parameters:
     - params: Parameters container, see `SendLocationParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendLocation(params: TGSendLocationParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendLocation")) else {
            throw BotError("Bad URL: \(getMethodURL("sendLocation"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
