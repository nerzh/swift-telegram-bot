import SwiftTelegramBot
import Logging

let botId = "..."
var logger = Logger(label: "SwiftTelegramBot")
logger.logLevel = .debug

let br = try await BotRunner(logger: logger, botId: botId)
try await br.addHandler(Handlers(bot: br.appContext.botActor.bot, logger: logger))
try await br.startAndWait4Finish()

