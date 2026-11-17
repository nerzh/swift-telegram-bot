//
//  configure.swift
//  Hummingbird-URLSession-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Hummingbird
import SwiftTelegramBot

public func configure(_ app: some ApplicationProtocol, connectionType: TGConnectionType) async throws -> TGBot {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    
    /// SET WEBHOOK CONNECTION
//    let bot: TGBot = try await TGBot(
//        connectionType: connectionType,
//        tgClient: TGClientDefault(),
//        tgURI: TGBot.standardTGURL,
//        botId: tgApi,
//        log: app.logger
//     )

    /// SET LONGPOLLING CONNECTION
    let bot: TGBot = try await TGBot(
        connectionType: connectionType,
        tgClient: TGClientDefault(),
        tgURI: TGBot.standardTGURL,
        botId: tgApi,
        log: app.logger
    )

    // set level of debug if you needed
    // bot.log.logLevel = .error
    try await bot.add(dispatcher: DefaultBotHandlers(bot: bot, logger: app.logger))
    return bot
}
