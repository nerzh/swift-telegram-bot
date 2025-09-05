//
//  SwiftTelegramBotTests.swift
//  SwiftTelegramBot
//
//  Created by Oleh Hudeichuk on 04.09.2025.
//

import Foundation
import XCTest
import Logging
@testable import SwiftTelegramBot

final class swift_telegram_botTests: XCTestCase {
    
    class TestDispatcher: TGDefaultDispatcher, @unchecked Sendable {
        
        override
        func handle() async {
            await add(TGBaseHandler({ update in
                guard let message = update.message else { return }
                let params: TGSendMessageParams = .init(chatId: .chat(message.chat.id), text: "TGBaseHandler")
                try await self.bot.sendMessage(params: params)
            }))
            
            await add(TGCommandHandler(commands: ["/ping"]) { update in
                try await update.message?.reply(text: "pong", bot: self.bot)
            })
            
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
        
        deinit {
            print("deinit \(Self.self)")
        }
    }
    
    func testBot() async throws {
        
        let botId: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
        
        var logger: Logger = .init(label: "swift_telegram_botTests")
        logger.logLevel = .error
        let connectionType: TGConnectionType = .longpolling()
        
        let bot: TGBot = try await .init(connectionType: connectionType,
                                         tgClient: TGClientDefault(),
                                         tgURI: TGBot.standardTGURL,
                                         botId: botId,
                                         log: logger)
        try await bot.add(dispatcher: TestDispatcher.self)
        print("Start")
        try await bot.start()
        while !Task.isCancelled {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        print("Finish")
        
        XCTAssertEqual("", "")
    }
}
