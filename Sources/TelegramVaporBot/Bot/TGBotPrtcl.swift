// Telegram-vapor-bot - Telegram Bot Swift SDK.

import Vapor

public protocol TGBotPrtcl {

    var botId: String { get set }
    var tgURI: URI { get set }
    var tgClient: TGClientPrtcl { get set }
    var connection: TGConnectionPrtcl  { get }

    static var log: Logger { get }

    func start() throws

    @discardableResult
    func getUpdates(params: TGGetUpdatesParams?) throws -> EventLoopFuture<[TGUpdate]>

    @discardableResult
    func setWebhook(params: TGSetWebhookParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteWebhook(params: TGDeleteWebhookParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getWebhookInfo() throws -> EventLoopFuture<TGWebhookInfo>

    @discardableResult
    func getMe() throws -> EventLoopFuture<TGUser>

    @discardableResult
    func logOut() throws -> EventLoopFuture<Bool>

    @discardableResult
    func close() throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendMessage(params: TGSendMessageParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func forwardMessage(params: TGForwardMessageParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func copyMessage(params: TGCopyMessageParams) throws -> EventLoopFuture<TGMessageId>

    @discardableResult
    func sendPhoto(params: TGSendPhotoParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendAudio(params: TGSendAudioParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendDocument(params: TGSendDocumentParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVideo(params: TGSendVideoParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendAnimation(params: TGSendAnimationParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVoice(params: TGSendVoiceParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendVideoNote(params: TGSendVideoNoteParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendMediaGroup(params: TGSendMediaGroupParams) throws -> EventLoopFuture<[TGMessage]>

    @discardableResult
    func sendLocation(params: TGSendLocationParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func editMessageLiveLocation(params: TGEditMessageLiveLocationParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func stopMessageLiveLocation(params: TGStopMessageLiveLocationParams?) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func sendVenue(params: TGSendVenueParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendContact(params: TGSendContactParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendPoll(params: TGSendPollParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendDice(params: TGSendDiceParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func sendChatAction(params: TGSendChatActionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getUserProfilePhotos(params: TGGetUserProfilePhotosParams) throws -> EventLoopFuture<TGUserProfilePhotos>

    @discardableResult
    func getFile(params: TGGetFileParams) throws -> EventLoopFuture<TGFile>

    @discardableResult
    func banChatMember(params: TGBanChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unbanChatMember(params: TGUnbanChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func restrictChatMember(params: TGRestrictChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func promoteChatMember(params: TGPromoteChatMemberParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatAdministratorCustomTitle(params: TGSetChatAdministratorCustomTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func banChatSenderChat(params: TGBanChatSenderChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unbanChatSenderChat(params: TGUnbanChatSenderChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatPermissions(params: TGSetChatPermissionsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func exportChatInviteLink(params: TGExportChatInviteLinkParams) throws -> EventLoopFuture<String>

    @discardableResult
    func createChatInviteLink(params: TGCreateChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func editChatInviteLink(params: TGEditChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func revokeChatInviteLink(params: TGRevokeChatInviteLinkParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func approveChatJoinRequest(params: TGApproveChatJoinRequestParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func declineChatJoinRequest(params: TGDeclineChatJoinRequestParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatPhoto(params: TGSetChatPhotoParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteChatPhoto(params: TGDeleteChatPhotoParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatTitle(params: TGSetChatTitleParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setChatDescription(params: TGSetChatDescriptionParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func pinChatMessage(params: TGPinChatMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinChatMessage(params: TGUnpinChatMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinAllChatMessages(params: TGUnpinAllChatMessagesParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func leaveChat(params: TGLeaveChatParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getChat(params: TGGetChatParams) throws -> EventLoopFuture<TGChat>

    @discardableResult
    func getChatAdministrators(params: TGGetChatAdministratorsParams) throws -> EventLoopFuture<[TGChatMember]>

    @discardableResult
    func getChatMemberCount(params: TGGetChatMemberCountParams) throws -> EventLoopFuture<Int>

    @discardableResult
    func getChatMember(params: TGGetChatMemberParams) throws -> EventLoopFuture<TGChatMember>

    @discardableResult
    func setChatStickerSet(params: TGSetChatStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteChatStickerSet(params: TGDeleteChatStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getForumTopicIconStickers() throws -> EventLoopFuture<[TGSticker]>

    @discardableResult
    func createForumTopic(params: TGCreateForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func editForumTopic(params: TGEditForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func closeForumTopic(params: TGCloseForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func reopenForumTopic(params: TGReopenForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteForumTopic(params: TGDeleteForumTopicParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func unpinAllForumTopicMessages(params: TGUnpinAllForumTopicMessagesParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerCallbackQuery(params: TGAnswerCallbackQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setMyCommands(params: TGSetMyCommandsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteMyCommands(params: TGDeleteMyCommandsParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getMyCommands(params: TGGetMyCommandsParams?) throws -> EventLoopFuture<[TGBotCommand]>

    @discardableResult
    func setChatMenuButton(params: TGSetChatMenuButtonParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getChatMenuButton(params: TGGetChatMenuButtonParams?) throws -> EventLoopFuture<TGMenuButton>

    @discardableResult
    func setMyDefaultAdministratorRights(params: TGSetMyDefaultAdministratorRightsParams?) throws -> EventLoopFuture<Bool>

    @discardableResult
    func getMyDefaultAdministratorRights(params: TGGetMyDefaultAdministratorRightsParams?) throws -> EventLoopFuture<TGChatAdministratorRights>

    @discardableResult
    func editMessageText(params: TGEditMessageTextParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageCaption(params: TGEditMessageCaptionParams?) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageMedia(params: TGEditMessageMediaParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func editMessageReplyMarkup(params: TGEditMessageReplyMarkupParams?) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func stopPoll(params: TGStopPollParams) throws -> EventLoopFuture<TGPoll>

    @discardableResult
    func deleteMessage(params: TGDeleteMessageParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendSticker(params: TGSendStickerParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func getStickerSet(params: TGGetStickerSetParams) throws -> EventLoopFuture<TGStickerSet>

    @discardableResult
    func getCustomEmojiStickers(params: TGGetCustomEmojiStickersParams) throws -> EventLoopFuture<[TGSticker]>

    @discardableResult
    func uploadStickerFile(params: TGUploadStickerFileParams) throws -> EventLoopFuture<TGFile>

    @discardableResult
    func createNewStickerSet(params: TGCreateNewStickerSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func addStickerToSet(params: TGAddStickerToSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerPositionInSet(params: TGSetStickerPositionInSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func deleteStickerFromSet(params: TGDeleteStickerFromSetParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setStickerSetThumb(params: TGSetStickerSetThumbParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerInlineQuery(params: TGAnswerInlineQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerWebAppQuery(params: TGAnswerWebAppQueryParams) throws -> EventLoopFuture<TGSentWebAppMessage>

    @discardableResult
    func sendInvoice(params: TGSendInvoiceParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func createInvoiceLink(params: TGCreateInvoiceLinkParams) throws -> EventLoopFuture<String>

    @discardableResult
    func answerShippingQuery(params: TGAnswerShippingQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func answerPreCheckoutQuery(params: TGAnswerPreCheckoutQueryParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func setPassportDataErrors(params: TGSetPassportDataErrorsParams) throws -> EventLoopFuture<Bool>

    @discardableResult
    func sendGame(params: TGSendGameParams) throws -> EventLoopFuture<TGMessage>

    @discardableResult
    func setGameScore(params: TGSetGameScoreParams) throws -> EventLoopFuture<TGMessageOrBool>

    @discardableResult
    func getGameHighScores(params: TGGetGameHighScoresParams) throws -> EventLoopFuture<[TGGameHighScore]>

}

