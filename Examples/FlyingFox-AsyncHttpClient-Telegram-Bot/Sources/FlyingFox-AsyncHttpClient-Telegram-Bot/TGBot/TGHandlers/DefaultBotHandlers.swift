//
//  DefaultBotHandlers.swift
//  FlyingFox-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 01.06.2021.
//

import SwiftTelegramBot

final class DefaultBotHandlers: TGDefaultDispatcher, @unchecked Sendable {

    override
    func handle() async {
        await defaultBaseHandler()
        await messageHandler()
        await commandPingHandler()
        await commandShowButtonsHandler()
        await buttonsActionHandler()
    }
    
    private func defaultBaseHandler() async {
        await add(TGBaseHandler({ update in
            guard let message = update.message else { return }
            let params: TGSendMessageParams = .init(chatId: .chat(message.chat.id), text: "TGBaseHandler")
            try await self.bot.sendMessage(params: params)
        }))
    }

    private func messageHandler() async {
        await add(TGMessageHandler(filters: (.all && !.command.names(["/ping", "/show_buttons"]))) { update in
            let params: TGSendMessageParams = .init(chatId: .chat(update.message!.chat.id), text: "Success")
            try await self.bot.sendMessage(params: params)
        })
    }

    private func commandPingHandler() async {
        await add(TGCommandHandler(commands: ["/ping"]) { update in
            try await update.message?.reply(text: "pong", bot: self.bot)
        })
    }

    private func commandShowButtonsHandler() async {
        await add(TGCommandHandler(commands: ["/show_buttons"]) { update in
            guard let userId = update.message?.from?.id else { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "Button 1", callbackData: "press 1"), .init(text: "Button 2", callbackData: "press 2")]
            ]
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "Keyboard active",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try await self.bot.sendMessage(params: params)
        })
    }

    private func buttonsActionHandler() async {
        await add(TGCallbackQueryHandler(pattern: "press 1") { update in
            await self.bot.log.info("press 1")
            guard let userId = update.callbackQuery?.from.id else { fatalError("user id not found") }
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await self.bot.answerCallbackQuery(params: params)
            try await self.bot.sendMessage(params: .init(chatId: .chat(userId), text: "press 1"))
        })
        
        await add(TGCallbackQueryHandler(pattern: "press 2") { update in
            await self.bot.log.info("press 2")
            guard let userId = update.callbackQuery?.from.id else { fatalError("user id not found") }
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await self.bot.answerCallbackQuery(params: params)
            try await self.bot.sendMessage(params: .init(chatId: .chat(userId), text: "press 2"))
        })
    }
}
