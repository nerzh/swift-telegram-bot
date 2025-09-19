//
//  configure.swift
//  Hummingbird-URLSession-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Hummingbird
import SwiftTelegramBot

public func configure(_ app: some ApplicationProtocol) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    
    /// SET WEBHOOK CONNECTION
    // let bot: TGBot = try await .init(connectionType: .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!),
    //                                  tgClient: URLSessionTGClient(),
    //                                  tgURI: TGBot.standardTGURL,
    //                                  botId: tgApi,
    //                                  log: app.logger)
    
    /// SET LONGPOLLING CONNECTION
    let bot: TGBot = try await .init(connectionType: .longpolling(),
                                     tgClient: URLSessionTGClient(),
                                     tgURI: TGBot.standardTGURL,
                                     botId: tgApi,
                                     log: app.logger)
    
    // set level of debug if you needed
    // bot.log.logLevel = .error
    await botActor.setBot(bot)
    try await botActor.bot.add(dispatcher: DefaultBotHandlers(bot: bot, logger: app.logger))
    try await botActor.bot.start()
}
