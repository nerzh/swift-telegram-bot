
import SwiftTelegramBot
import Foundation

public extension TGUpdate {
    var custChatId: Int64 {
        let id1 = self.message?.chat.id
        let id2 = self.callbackQuery?.message?.chat.id
        let id3 = self.editedMessage?.chat.id
        let id4 = self.channelPost?.chat.id
        let id5 = self.myChatMember?.from.id
        let id6 = self.myChatMember?.chat.id
        
        if let id = id1 ?? id2 ?? id3 ?? id4 ?? id5 ?? id6 {
            return id
        }
        
        return id6!
    }
}

extension TGBot {
    @discardableResult
    func sendMessage(chatId: Int64, parseMode: TGParseMode? = .html, _ text: String, replyTo msg: TGMessage? = nil) async throws -> TGMessage  {
        let previewOpt = TGLinkPreviewOptions(isDisabled: true)
        var replyParams: TGReplyParameters?
        
        if let msg {
            replyParams = TGReplyParameters(messageId: msg.messageId, chatId: .chat(chatId))
        }
        
        return try await self.sendMessage(params: .init(chatId: .chat(chatId), text: text, parseMode: parseMode, linkPreviewOptions: previewOpt, replyParameters: replyParams))
    }
}
