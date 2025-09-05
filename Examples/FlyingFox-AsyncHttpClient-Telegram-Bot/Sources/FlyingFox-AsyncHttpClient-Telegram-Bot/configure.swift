//
//  configure.swift
//  FlyingFox-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import Foundation
import FlyingFox
import SwiftTelegramBot

func configure(appContext: TelegramApplicationContext) async throws {
    let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    
    /// SET WEBHOOK CONNECTION
    // let bot: TGBot = try await .init(connectionType: .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!),
    //                                  dispatcher: nil,
    //                                  tgClient: URLSessionTGClient(),
    //                                  tgURI: TGBot.standardTGURL,
    //                                  botId: tgApi,
    //                                  log: appContext.logger)
    
    /// SET LONGPOLLING CONNECTION
    let bot: TGBot = try await .init(connectionType: .longpolling(),
                                     tgClient: AsyncHttpTGClient(),
                                     tgURI: TGBot.standardTGURL,
                                     botId: tgApi,
                                     log: appContext.logger)
    
    // set level of debug if you needed
    // bot.log.logLevel = .error
    
    await appContext.botActor.setBot(bot)
    try await appContext.botActor.bot.add(dispatcher: DefaultBotHandlers.self)
    try await appContext.botActor.bot.start()
}
