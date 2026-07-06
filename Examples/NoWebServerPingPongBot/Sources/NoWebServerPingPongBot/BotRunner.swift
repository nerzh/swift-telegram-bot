
import Foundation
import SwiftTelegramBot
import Logging
import Foundation

public struct BotRunner {
    public var appContext: TelegramApplicationContext
    
    public init(allowedUpdates: [TGUpdate.CodingKeys]? = nil, logger: Logger, botId: String) async throws {
        let botActor = TGBotActor()
        appContext = TelegramApplicationContext(logger: logger, botActor: botActor)
        
        let bot = try await TGBot(connectionType: .longpolling(allowedUpdates: allowedUpdates),
                                         tgClient: TGClientDefault(),
                                         tgURI: TGBot.standardTGURL,
                                         botId: botId,
                                         log: appContext.logger)
        
        await appContext.botActor.setBot(bot)
    }
    
    public func addHandler(_ dispatcher: any TGDefaultDispatcherPrtcl) async throws {
        try await appContext.botActor.bot.add(dispatcher: dispatcher)
    }
    
    public func startAndWait4Finish() async throws {
        try await appContext.botActor.bot.start()
        
        print("Started")
        
        while !Task.isCancelled {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        
        print("Finish")
    }
}

public actor TGBotActor {
    var _bot: TGBot!
    
    public var bot: TGBot {
        self._bot
    }
    
    func setBot(_ bot: TGBot) {
        self._bot = bot
    }
}

public struct TelegramApplicationContext {
    public let logger: Logger
    public let botActor: TGBotActor
}
