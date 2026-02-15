// Swift Telegram SDK - Telegram Bot Swift SDK.

/**
 This object represents a message.

 SeeAlso Telegram Bot API Reference:
 [Message](https://core.telegram.org/bots/api#message)
 **/
public final class TGMessage: Codable, Sendable {

    /// Custom keys for coding/decoding `Message` struct
    public enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case messageThreadId = "message_thread_id"
        case directMessagesTopic = "direct_messages_topic"
        case from = "from"
        case senderChat = "sender_chat"
        case senderBoostCount = "sender_boost_count"
        case senderBusinessBot = "sender_business_bot"
        case date = "date"
        case businessConnectionId = "business_connection_id"
        case chat = "chat"
        case forwardOrigin = "forward_origin"
        case isTopicMessage = "is_topic_message"
        case isAutomaticForward = "is_automatic_forward"
        case replyToMessage = "reply_to_message"
        case externalReply = "external_reply"
        case quote = "quote"
        case replyToStory = "reply_to_story"
        case replyToChecklistTaskId = "reply_to_checklist_task_id"
        case viaBot = "via_bot"
        case editDate = "edit_date"
        case hasProtectedContent = "has_protected_content"
        case isFromOffline = "is_from_offline"
        case isPaidPost = "is_paid_post"
        case mediaGroupId = "media_group_id"
        case authorSignature = "author_signature"
        case paidStarCount = "paid_star_count"
        case text = "text"
        case entities = "entities"
        case linkPreviewOptions = "link_preview_options"
        case suggestedPostInfo = "suggested_post_info"
        case effectId = "effect_id"
        case animation = "animation"
        case audio = "audio"
        case document = "document"
        case paidMedia = "paid_media"
        case photo = "photo"
        case sticker = "sticker"
        case story = "story"
        case video = "video"
        case videoNote = "video_note"
        case voice = "voice"
        case caption = "caption"
        case captionEntities = "caption_entities"
        case showCaptionAboveMedia = "show_caption_above_media"
        case hasMediaSpoiler = "has_media_spoiler"
        case checklist = "checklist"
        case contact = "contact"
        case dice = "dice"
        case game = "game"
        case poll = "poll"
        case venue = "venue"
        case location = "location"
        case newChatMembers = "new_chat_members"
        case leftChatMember = "left_chat_member"
        case chatOwnerLeft = "chat_owner_left"
        case chatOwnerChanged = "chat_owner_changed"
        case newChatTitle = "new_chat_title"
        case newChatPhoto = "new_chat_photo"
        case deleteChatPhoto = "delete_chat_photo"
        case groupChatCreated = "group_chat_created"
        case supergroupChatCreated = "supergroup_chat_created"
        case channelChatCreated = "channel_chat_created"
        case messageAutoDeleteTimerChanged = "message_auto_delete_timer_changed"
        case migrateToChatId = "migrate_to_chat_id"
        case migrateFromChatId = "migrate_from_chat_id"
        case pinnedMessage = "pinned_message"
        case invoice = "invoice"
        case successfulPayment = "successful_payment"
        case refundedPayment = "refunded_payment"
        case usersShared = "users_shared"
        case chatShared = "chat_shared"
        case gift = "gift"
        case uniqueGift = "unique_gift"
        case giftUpgradeSent = "gift_upgrade_sent"
        case connectedWebsite = "connected_website"
        case writeAccessAllowed = "write_access_allowed"
        case passportData = "passport_data"
        case proximityAlertTriggered = "proximity_alert_triggered"
        case boostAdded = "boost_added"
        case chatBackgroundSet = "chat_background_set"
        case checklistTasksDone = "checklist_tasks_done"
        case checklistTasksAdded = "checklist_tasks_added"
        case directMessagePriceChanged = "direct_message_price_changed"
        case forumTopicCreated = "forum_topic_created"
        case forumTopicEdited = "forum_topic_edited"
        case forumTopicClosed = "forum_topic_closed"
        case forumTopicReopened = "forum_topic_reopened"
        case generalForumTopicHidden = "general_forum_topic_hidden"
        case generalForumTopicUnhidden = "general_forum_topic_unhidden"
        case giveawayCreated = "giveaway_created"
        case giveaway = "giveaway"
        case giveawayWinners = "giveaway_winners"
        case giveawayCompleted = "giveaway_completed"
        case paidMessagePriceChanged = "paid_message_price_changed"
        case suggestedPostApproved = "suggested_post_approved"
        case suggestedPostApprovalFailed = "suggested_post_approval_failed"
        case suggestedPostDeclined = "suggested_post_declined"
        case suggestedPostPaid = "suggested_post_paid"
        case suggestedPostRefunded = "suggested_post_refunded"
        case videoChatScheduled = "video_chat_scheduled"
        case videoChatStarted = "video_chat_started"
        case videoChatEnded = "video_chat_ended"
        case videoChatParticipantsInvited = "video_chat_participants_invited"
        case webAppData = "web_app_data"
        case replyMarkup = "reply_markup"
    }

    /// Unique message identifier inside this chat. In specific instances (e.g., message containing a video sent to a big chat), the server might automatically schedule a message instead of sending it immediately. In such cases, this field will be 0 and the relevant message will be unusable until it is actually sent
    public let messageId: Int

    /// Optional. Unique identifier of a message thread or forum topic to which the message belongs; for supergroups and private chats only
    public let messageThreadId: Int?

    /// Optional. Information about the direct messages chat topic that contains the message
    public let directMessagesTopic: TGDirectMessagesTopic?

    /// Optional. Sender of the message; may be empty for messages sent to channels. For backward compatibility, if the message was sent on behalf of a chat, the field contains a fake sender user in non-channel chats
    public let from: TGUser?

    /// Optional. Sender of the message when sent on behalf of a chat. For example, the supergroup itself for messages sent by its anonymous administrators or a linked channel for messages automatically forwarded to the channel's discussion group. For backward compatibility, if the message was sent on behalf of a chat, the field from contains a fake sender user in non-channel chats.
    public let senderChat: TGChat?

    /// Optional. If the sender of the message boosted the chat, the number of boosts added by the user
    public let senderBoostCount: Int?

    /// Optional. The bot that actually sent the message on behalf of the business account. Available only for outgoing messages sent on behalf of the connected business account.
    public let senderBusinessBot: TGUser?

    /// Date the message was sent in Unix time. It is always a positive number, representing a valid date.
    public let date: Int

    /// Optional. Unique identifier of the business connection from which the message was received. If non-empty, the message belongs to a chat of the corresponding business account that is independent from any potential bot chat which might share the same identifier.
    public let businessConnectionId: String?

    /// Chat the message belongs to
    public let chat: TGChat

    /// Optional. Information about the original message for forwarded messages
    public let forwardOrigin: TGMessageOrigin?

    /// Optional. True, if the message is sent to a topic in a forum supergroup or a private chat with the bot
    public let isTopicMessage: Bool?

    /// Optional. True, if the message is a channel post that was automatically forwarded to the connected discussion group
    public let isAutomaticForward: Bool?

    /// Optional. For replies in the same chat and message thread, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    public let replyToMessage: TGMessage?

    /// Optional. Information about the message that is being replied to, which may come from another chat or forum topic
    public let externalReply: TGExternalReplyInfo?

    /// Optional. For replies that quote part of the original message, the quoted part of the message
    public let quote: TGTextQuote?

    /// Optional. For replies to a story, the original story
    public let replyToStory: TGStory?

    /// Optional. Identifier of the specific checklist task that is being replied to
    public let replyToChecklistTaskId: Int?

    /// Optional. Bot through which the message was sent
    public let viaBot: TGUser?

    /// Optional. Date the message was last edited in Unix time
    public let editDate: Int?

    /// Optional. True, if the message can't be forwarded
    public let hasProtectedContent: Bool?

    /// Optional. True, if the message was sent by an implicit action, for example, as an away or a greeting business message, or as a scheduled message
    public let isFromOffline: Bool?

    /// Optional. True, if the message is a paid post. Note that such posts must not be deleted for 24 hours to receive the payment and can't be edited.
    public let isPaidPost: Bool?

    /// Optional. The unique identifier of a media message group this message belongs to
    public let mediaGroupId: String?

    /// Optional. Signature of the post author for messages in channels, or the custom title of an anonymous group administrator
    public let authorSignature: String?

    /// Optional. The number of Telegram Stars that were paid by the sender of the message to send it
    public let paidStarCount: Int?

    /// Optional. For text messages, the actual UTF-8 text of the message
    public let text: String?

    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    public let entities: [TGMessageEntity]?

    /// Optional. Options used for link preview generation for the message, if it is a text message and link preview options were changed
    public let linkPreviewOptions: TGLinkPreviewOptions?

    /// Optional. Information about suggested post parameters if the message is a suggested post in a channel direct messages chat. If the message is an approved or declined suggested post, then it can't be edited.
    public let suggestedPostInfo: TGSuggestedPostInfo?

    /// Optional. Unique identifier of the message effect added to the message
    public let effectId: String?

    /// Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
    public let animation: TGAnimation?

    /// Optional. Message is an audio file, information about the file
    public let audio: TGAudio?

    /// Optional. Message is a general file, information about the file
    public let document: TGDocument?

    /// Optional. Message contains paid media; information about the paid media
    public let paidMedia: TGPaidMediaInfo?

    /// Optional. Message is a photo, available sizes of the photo
    public let photo: [TGPhotoSize]?

    /// Optional. Message is a sticker, information about the sticker
    public let sticker: TGSticker?

    /// Optional. Message is a forwarded story
    public let story: TGStory?

    /// Optional. Message is a video, information about the video
    public let video: TGVideo?

    /// Optional. Message is a video note, information about the video message
    public let videoNote: TGVideoNote?

    /// Optional. Message is a voice message, information about the file
    public let voice: TGVoice?

    /// Optional. Caption for the animation, audio, document, paid media, photo, video or voice
    public let caption: String?

    /// Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
    public let captionEntities: [TGMessageEntity]?

    /// Optional. True, if the caption must be shown above the message media
    public let showCaptionAboveMedia: Bool?

    /// Optional. True, if the message media is covered by a spoiler animation
    public let hasMediaSpoiler: Bool?

    /// Optional. Message is a checklist
    public let checklist: TGChecklist?

    /// Optional. Message is a shared contact, information about the contact
    public let contact: TGContact?

    /// Optional. Message is a dice with random value
    public let dice: TGDice?

    /// Optional. Message is a game, information about the game. More about games »
    public let game: TGGame?

    /// Optional. Message is a native poll, information about the poll
    public let poll: TGPoll?

    /// Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
    public let venue: TGVenue?

    /// Optional. Message is a shared location, information about the location
    public let location: TGLocation?

    /// Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    public let newChatMembers: [TGUser]?

    /// Optional. A member was removed from the group, information about them (this member may be the bot itself)
    public let leftChatMember: TGUser?

    /// Optional. Service message: chat owner has left
    public let chatOwnerLeft: TGChatOwnerLeft?

    /// Optional. Service message: chat owner has changed
    public let chatOwnerChanged: TGChatOwnerChanged?

    /// Optional. A chat title was changed to this value
    public let newChatTitle: String?

    /// Optional. A chat photo was change to this value
    public let newChatPhoto: [TGPhotoSize]?

    /// Optional. Service message: the chat photo was deleted
    public let deleteChatPhoto: Bool?

    /// Optional. Service message: the group has been created
    public let groupChatCreated: Bool?

    /// Optional. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    public let supergroupChatCreated: Bool?

    /// Optional. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    public let channelChatCreated: Bool?

    /// Optional. Service message: auto-delete timer settings changed in the chat
    public let messageAutoDeleteTimerChanged: TGMessageAutoDeleteTimerChanged?

    /// Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public let migrateToChatId: Int64?

    /// Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public let migrateFromChatId: Int64?

    /// Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    public let pinnedMessage: TGMaybeInaccessibleMessage?

    /// Optional. Message is an invoice for a payment, information about the invoice. More about payments »
    public let invoice: TGInvoice?

    /// Optional. Message is a service message about a successful payment, information about the payment. More about payments »
    public let successfulPayment: TGSuccessfulPayment?

    /// Optional. Message is a service message about a refunded payment, information about the payment. More about payments »
    public let refundedPayment: TGRefundedPayment?

    /// Optional. Service message: users were shared with the bot
    public let usersShared: TGUsersShared?

    /// Optional. Service message: a chat was shared with the bot
    public let chatShared: TGChatShared?

    /// Optional. Service message: a regular gift was sent or received
    public let gift: TGGiftInfo?

    /// Optional. Service message: a unique gift was sent or received
    public let uniqueGift: TGUniqueGiftInfo?

    /// Optional. Service message: upgrade of a gift was purchased after the gift was sent
    public let giftUpgradeSent: TGGiftInfo?

    /// Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
    public let connectedWebsite: String?

    /// Optional. Service message: the user allowed the bot to write messages after adding it to the attachment or side menu, launching a Web App from a link, or accepting an explicit request from a Web App sent by the method requestWriteAccess
    public let writeAccessAllowed: TGWriteAccessAllowed?

    /// Optional. Telegram Passport data
    public let passportData: TGPassportData?

    /// Optional. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
    public let proximityAlertTriggered: TGProximityAlertTriggered?

    /// Optional. Service message: user boosted the chat
    public let boostAdded: TGChatBoostAdded?

    /// Optional. Service message: chat background set
    public let chatBackgroundSet: TGChatBackground?

    /// Optional. Service message: some tasks in a checklist were marked as done or not done
    public let checklistTasksDone: TGChecklistTasksDone?

    /// Optional. Service message: tasks were added to a checklist
    public let checklistTasksAdded: TGChecklistTasksAdded?

    /// Optional. Service message: the price for paid messages in the corresponding direct messages chat of a channel has changed
    public let directMessagePriceChanged: TGDirectMessagePriceChanged?

    /// Optional. Service message: forum topic created
    public let forumTopicCreated: TGForumTopicCreated?

    /// Optional. Service message: forum topic edited
    public let forumTopicEdited: TGForumTopicEdited?

    /// Optional. Service message: forum topic closed
    public let forumTopicClosed: TGForumTopicClosed?

    /// Optional. Service message: forum topic reopened
    public let forumTopicReopened: TGForumTopicReopened?

    /// Optional. Service message: the 'General' forum topic hidden
    public let generalForumTopicHidden: TGGeneralForumTopicHidden?

    /// Optional. Service message: the 'General' forum topic unhidden
    public let generalForumTopicUnhidden: TGGeneralForumTopicUnhidden?

    /// Optional. Service message: a scheduled giveaway was created
    public let giveawayCreated: TGGiveawayCreated?

    /// Optional. The message is a scheduled giveaway message
    public let giveaway: TGGiveaway?

    /// Optional. A giveaway with public winners was completed
    public let giveawayWinners: TGGiveawayWinners?

    /// Optional. Service message: a giveaway without public winners was completed
    public let giveawayCompleted: TGGiveawayCompleted?

    /// Optional. Service message: the price for paid messages has changed in the chat
    public let paidMessagePriceChanged: TGPaidMessagePriceChanged?

    /// Optional. Service message: a suggested post was approved
    public let suggestedPostApproved: TGSuggestedPostApproved?

    /// Optional. Service message: approval of a suggested post has failed
    public let suggestedPostApprovalFailed: TGSuggestedPostApprovalFailed?

    /// Optional. Service message: a suggested post was declined
    public let suggestedPostDeclined: TGSuggestedPostDeclined?

    /// Optional. Service message: payment for a suggested post was received
    public let suggestedPostPaid: TGSuggestedPostPaid?

    /// Optional. Service message: payment for a suggested post was refunded
    public let suggestedPostRefunded: TGSuggestedPostRefunded?

    /// Optional. Service message: video chat scheduled
    public let videoChatScheduled: TGVideoChatScheduled?

    /// Optional. Service message: video chat started
    public let videoChatStarted: TGVideoChatStarted?

    /// Optional. Service message: video chat ended
    public let videoChatEnded: TGVideoChatEnded?

    /// Optional. Service message: new participants invited to a video chat
    public let videoChatParticipantsInvited: TGVideoChatParticipantsInvited?

    /// Optional. Service message: data sent by a Web App
    public let webAppData: TGWebAppData?

    /// Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    public let replyMarkup: TGInlineKeyboardMarkup?

    public init (messageId: Int, messageThreadId: Int? = nil, directMessagesTopic: TGDirectMessagesTopic? = nil, from: TGUser? = nil, senderChat: TGChat? = nil, senderBoostCount: Int? = nil, senderBusinessBot: TGUser? = nil, date: Int, businessConnectionId: String? = nil, chat: TGChat, forwardOrigin: TGMessageOrigin? = nil, isTopicMessage: Bool? = nil, isAutomaticForward: Bool? = nil, replyToMessage: TGMessage? = nil, externalReply: TGExternalReplyInfo? = nil, quote: TGTextQuote? = nil, replyToStory: TGStory? = nil, replyToChecklistTaskId: Int? = nil, viaBot: TGUser? = nil, editDate: Int? = nil, hasProtectedContent: Bool? = nil, isFromOffline: Bool? = nil, isPaidPost: Bool? = nil, mediaGroupId: String? = nil, authorSignature: String? = nil, paidStarCount: Int? = nil, text: String? = nil, entities: [TGMessageEntity]? = nil, linkPreviewOptions: TGLinkPreviewOptions? = nil, suggestedPostInfo: TGSuggestedPostInfo? = nil, effectId: String? = nil, animation: TGAnimation? = nil, audio: TGAudio? = nil, document: TGDocument? = nil, paidMedia: TGPaidMediaInfo? = nil, photo: [TGPhotoSize]? = nil, sticker: TGSticker? = nil, story: TGStory? = nil, video: TGVideo? = nil, videoNote: TGVideoNote? = nil, voice: TGVoice? = nil, caption: String? = nil, captionEntities: [TGMessageEntity]? = nil, showCaptionAboveMedia: Bool? = nil, hasMediaSpoiler: Bool? = nil, checklist: TGChecklist? = nil, contact: TGContact? = nil, dice: TGDice? = nil, game: TGGame? = nil, poll: TGPoll? = nil, venue: TGVenue? = nil, location: TGLocation? = nil, newChatMembers: [TGUser]? = nil, leftChatMember: TGUser? = nil, chatOwnerLeft: TGChatOwnerLeft? = nil, chatOwnerChanged: TGChatOwnerChanged? = nil, newChatTitle: String? = nil, newChatPhoto: [TGPhotoSize]? = nil, deleteChatPhoto: Bool? = nil, groupChatCreated: Bool? = nil, supergroupChatCreated: Bool? = nil, channelChatCreated: Bool? = nil, messageAutoDeleteTimerChanged: TGMessageAutoDeleteTimerChanged? = nil, migrateToChatId: Int64? = nil, migrateFromChatId: Int64? = nil, pinnedMessage: TGMaybeInaccessibleMessage? = nil, invoice: TGInvoice? = nil, successfulPayment: TGSuccessfulPayment? = nil, refundedPayment: TGRefundedPayment? = nil, usersShared: TGUsersShared? = nil, chatShared: TGChatShared? = nil, gift: TGGiftInfo? = nil, uniqueGift: TGUniqueGiftInfo? = nil, giftUpgradeSent: TGGiftInfo? = nil, connectedWebsite: String? = nil, writeAccessAllowed: TGWriteAccessAllowed? = nil, passportData: TGPassportData? = nil, proximityAlertTriggered: TGProximityAlertTriggered? = nil, boostAdded: TGChatBoostAdded? = nil, chatBackgroundSet: TGChatBackground? = nil, checklistTasksDone: TGChecklistTasksDone? = nil, checklistTasksAdded: TGChecklistTasksAdded? = nil, directMessagePriceChanged: TGDirectMessagePriceChanged? = nil, forumTopicCreated: TGForumTopicCreated? = nil, forumTopicEdited: TGForumTopicEdited? = nil, forumTopicClosed: TGForumTopicClosed? = nil, forumTopicReopened: TGForumTopicReopened? = nil, generalForumTopicHidden: TGGeneralForumTopicHidden? = nil, generalForumTopicUnhidden: TGGeneralForumTopicUnhidden? = nil, giveawayCreated: TGGiveawayCreated? = nil, giveaway: TGGiveaway? = nil, giveawayWinners: TGGiveawayWinners? = nil, giveawayCompleted: TGGiveawayCompleted? = nil, paidMessagePriceChanged: TGPaidMessagePriceChanged? = nil, suggestedPostApproved: TGSuggestedPostApproved? = nil, suggestedPostApprovalFailed: TGSuggestedPostApprovalFailed? = nil, suggestedPostDeclined: TGSuggestedPostDeclined? = nil, suggestedPostPaid: TGSuggestedPostPaid? = nil, suggestedPostRefunded: TGSuggestedPostRefunded? = nil, videoChatScheduled: TGVideoChatScheduled? = nil, videoChatStarted: TGVideoChatStarted? = nil, videoChatEnded: TGVideoChatEnded? = nil, videoChatParticipantsInvited: TGVideoChatParticipantsInvited? = nil, webAppData: TGWebAppData? = nil, replyMarkup: TGInlineKeyboardMarkup? = nil) {
        self.messageId = messageId
        self.messageThreadId = messageThreadId
        self.directMessagesTopic = directMessagesTopic
        self.from = from
        self.senderChat = senderChat
        self.senderBoostCount = senderBoostCount
        self.senderBusinessBot = senderBusinessBot
        self.date = date
        self.businessConnectionId = businessConnectionId
        self.chat = chat
        self.forwardOrigin = forwardOrigin
        self.isTopicMessage = isTopicMessage
        self.isAutomaticForward = isAutomaticForward
        self.replyToMessage = replyToMessage
        self.externalReply = externalReply
        self.quote = quote
        self.replyToStory = replyToStory
        self.replyToChecklistTaskId = replyToChecklistTaskId
        self.viaBot = viaBot
        self.editDate = editDate
        self.hasProtectedContent = hasProtectedContent
        self.isFromOffline = isFromOffline
        self.isPaidPost = isPaidPost
        self.mediaGroupId = mediaGroupId
        self.authorSignature = authorSignature
        self.paidStarCount = paidStarCount
        self.text = text
        self.entities = entities
        self.linkPreviewOptions = linkPreviewOptions
        self.suggestedPostInfo = suggestedPostInfo
        self.effectId = effectId
        self.animation = animation
        self.audio = audio
        self.document = document
        self.paidMedia = paidMedia
        self.photo = photo
        self.sticker = sticker
        self.story = story
        self.video = video
        self.videoNote = videoNote
        self.voice = voice
        self.caption = caption
        self.captionEntities = captionEntities
        self.showCaptionAboveMedia = showCaptionAboveMedia
        self.hasMediaSpoiler = hasMediaSpoiler
        self.checklist = checklist
        self.contact = contact
        self.dice = dice
        self.game = game
        self.poll = poll
        self.venue = venue
        self.location = location
        self.newChatMembers = newChatMembers
        self.leftChatMember = leftChatMember
        self.chatOwnerLeft = chatOwnerLeft
        self.chatOwnerChanged = chatOwnerChanged
        self.newChatTitle = newChatTitle
        self.newChatPhoto = newChatPhoto
        self.deleteChatPhoto = deleteChatPhoto
        self.groupChatCreated = groupChatCreated
        self.supergroupChatCreated = supergroupChatCreated
        self.channelChatCreated = channelChatCreated
        self.messageAutoDeleteTimerChanged = messageAutoDeleteTimerChanged
        self.migrateToChatId = migrateToChatId
        self.migrateFromChatId = migrateFromChatId
        self.pinnedMessage = pinnedMessage
        self.invoice = invoice
        self.successfulPayment = successfulPayment
        self.refundedPayment = refundedPayment
        self.usersShared = usersShared
        self.chatShared = chatShared
        self.gift = gift
        self.uniqueGift = uniqueGift
        self.giftUpgradeSent = giftUpgradeSent
        self.connectedWebsite = connectedWebsite
        self.writeAccessAllowed = writeAccessAllowed
        self.passportData = passportData
        self.proximityAlertTriggered = proximityAlertTriggered
        self.boostAdded = boostAdded
        self.chatBackgroundSet = chatBackgroundSet
        self.checklistTasksDone = checklistTasksDone
        self.checklistTasksAdded = checklistTasksAdded
        self.directMessagePriceChanged = directMessagePriceChanged
        self.forumTopicCreated = forumTopicCreated
        self.forumTopicEdited = forumTopicEdited
        self.forumTopicClosed = forumTopicClosed
        self.forumTopicReopened = forumTopicReopened
        self.generalForumTopicHidden = generalForumTopicHidden
        self.generalForumTopicUnhidden = generalForumTopicUnhidden
        self.giveawayCreated = giveawayCreated
        self.giveaway = giveaway
        self.giveawayWinners = giveawayWinners
        self.giveawayCompleted = giveawayCompleted
        self.paidMessagePriceChanged = paidMessagePriceChanged
        self.suggestedPostApproved = suggestedPostApproved
        self.suggestedPostApprovalFailed = suggestedPostApprovalFailed
        self.suggestedPostDeclined = suggestedPostDeclined
        self.suggestedPostPaid = suggestedPostPaid
        self.suggestedPostRefunded = suggestedPostRefunded
        self.videoChatScheduled = videoChatScheduled
        self.videoChatStarted = videoChatStarted
        self.videoChatEnded = videoChatEnded
        self.videoChatParticipantsInvited = videoChatParticipantsInvited
        self.webAppData = webAppData
        self.replyMarkup = replyMarkup
    }
}
