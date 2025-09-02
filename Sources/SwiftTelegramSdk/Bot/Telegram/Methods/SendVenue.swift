// Swift Telegram SDK - Telegram Bot Swift SDK.

import Foundation

/// DESCRIPTION:
/// Use this method to send information about a venue. On success, the sent Message is returned.


/// Parameters container struct for `sendVenue` method
public struct TGSendVenueParams: Encodable, Sendable {

    /// Unique identifier of the business connection on behalf of which the message will be sent
    public let businessConnectionId: String?

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public let chatId: TGChatId

    /// Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    public let messageThreadId: Int?

    /// Identifier of the direct messages topic to which the message will be sent; required if the message is sent to a direct messages chat
    public let directMessagesTopicId: Int?

    /// Latitude of the venue
    public let latitude: Float

    /// Longitude of the venue
    public let longitude: Float

    /// Name of the venue
    public let title: String

    /// Address of the venue
    public let address: String

    /// Foursquare identifier of the venue
    public let foursquareId: String?

    /// Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    public let foursquareType: String?

    /// Google Places identifier of the venue
    public let googlePlaceId: String?

    /// Google Places type of the venue. (See supported types.)
    public let googlePlaceType: String?

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

    /// Custom keys for coding/decoding `SendVenueParams` struct
    public enum CodingKeys: String, CodingKey {
            case businessConnectionId = "business_connection_id"
            case chatId = "chat_id"
            case messageThreadId = "message_thread_id"
            case directMessagesTopicId = "direct_messages_topic_id"
            case latitude = "latitude"
            case longitude = "longitude"
            case title = "title"
            case address = "address"
            case foursquareId = "foursquare_id"
            case foursquareType = "foursquare_type"
            case googlePlaceId = "google_place_id"
            case googlePlaceType = "google_place_type"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case allowPaidBroadcast = "allow_paid_broadcast"
            case messageEffectId = "message_effect_id"
            case suggestedPostParameters = "suggested_post_parameters"
            case replyParameters = "reply_parameters"
            case replyMarkup = "reply_markup"
    }

    public init(businessConnectionId: String? = nil, chatId: TGChatId, messageThreadId: Int? = nil, directMessagesTopicId: Int? = nil, latitude: Float, longitude: Float, title: String, address: String, foursquareId: String? = nil, foursquareType: String? = nil, googlePlaceId: String? = nil, googlePlaceType: String? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, allowPaidBroadcast: Bool? = nil, messageEffectId: String? = nil, suggestedPostParameters: TGSuggestedPostParameters? = nil, replyParameters: TGReplyParameters? = nil, replyMarkup: TGReplyMarkup? = nil) {
            self.businessConnectionId = businessConnectionId
            self.chatId = chatId
            self.messageThreadId = messageThreadId
            self.directMessagesTopicId = directMessagesTopicId
            self.latitude = latitude
            self.longitude = longitude
            self.title = title
            self.address = address
            self.foursquareId = foursquareId
            self.foursquareType = foursquareType
            self.googlePlaceId = googlePlaceId
            self.googlePlaceType = googlePlaceType
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
 Use this method to send information about a venue. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendVenueParams](https://core.telegram.org/bots/api#sendvenue)
 
 - Parameters:
     - params: Parameters container, see `SendVenueParams` struct
 - Throws: Throws on errors
 - Returns: `TGMessage`
 */

    @discardableResult
    func sendVenue(params: TGSendVenueParams) async throws -> TGMessage {
        guard let methodURL: URL = .init(string: getMethodURL("sendVenue")) else {
            throw BotError("Bad URL: \(getMethodURL("sendVenue"))")
        }
        let result: TGMessage = try await tgClient.post(methodURL, params: params, as: nil)
        return result
    }
}
