//
//  configure.swift
//  Vapor-telegram-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import Vapor
import SwiftTelegramBot

public func configure(_ app: Application) async throws {
        let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    
    /// SET WEBHOOK CONNECTION
    // let bot: TGBot = try await .init(connectionType: .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!),
    //                            tgClient: TGClientDefault(),
    //                            tgURI: TGBot.standardTGURL, botId: tgApi, log: app.logger)
    
    /// SET LONGPOLLING CONNECTION
    // set level of debug if you needed
    app.logger.logLevel = .info
    app.bot = try await .init(connectionType: .longpolling(),
                                     tgClient: TGClientDefault(),
                                     tgURI: TGBot.standardTGURL,
                                     botId: tgApi,
                                     log: app.logger)
    try await app.bot.add(dispatcher: DefaultBotHandlers(bot: app.bot, logger: app.logger))
    try await app.bot.start()
    
    try routes(app)
}
