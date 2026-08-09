//
//  main.swift
//  Hummingbird-URLSession-bot-example
//
//  Created by Oleh Hudeichuk on 21.05.2021.
//

import SwiftTelegramBot
import Hummingbird
import Logging
import ServiceLifecycle

let connectionType: TGConnectionType = .longpolling()
//let connectionType: TGConnectionType = .webhook(webHookURL: URL(string: "https://your_domain/telegramWebHook")!)

var logger = Logger(label: "SwiftTelegramBot")
logger.logLevel = .debug

let router = Router()
router.middlewares.add(LogRequestsMiddleware(.info))

let telegramUpdates = TelegramUpdateQueue()
TelegramController(updates: telegramUpdates).addRoutes(to: router.group("tgbot"))

var app = Application(router: router, logger: logger)
let bot = try await configure(app, connectionType: connectionType)

switch connectionType {
case .longpolling:
    app.addServices(bot)
case .webhook:
    app.addServices(
        TelegramWebhookBotService(
            bot: bot,
            updates: telegramUpdates
        )
    )
}

try await app.runService()
