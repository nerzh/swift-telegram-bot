
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
    
    public func startAndWait4Finish(singleAction: () async throws -> () = { },
                                    periodicAction: () async throws -> () = { }
    ) async throws {
        await makeSureOnlyOneProcessRunned()
        
        try await appContext.botActor.bot.start()
        
        print("Started")
        
        try await singleAction()
        
        while true {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            try await periodicAction()
        }
    }
    
    private func makeSureOnlyOneProcessRunned() async {
        await MainActor.run {
            guard SingleInstance.acquireLock(appName: ProcessInfo.processInfo.processName)
            else {
                print("Another instance is already running.")
                exit(EXIT_FAILURE)
            }
        }
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
