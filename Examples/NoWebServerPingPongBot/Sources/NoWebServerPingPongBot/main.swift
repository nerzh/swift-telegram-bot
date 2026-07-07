
import SwiftTelegramBot
import Logging

let botId = "..."// INSERT HERE ID FROM BOTFATHER
var logger = Logger(label: "SwiftTelegramBot")
logger.logLevel = .info

let br = try await BotRunner(logger: logger, botId: botId)
try await br.addHandler(Handlers(bot: br.appContext.botActor.bot, logger: logger))
try await br.startAndWait4Finish()
