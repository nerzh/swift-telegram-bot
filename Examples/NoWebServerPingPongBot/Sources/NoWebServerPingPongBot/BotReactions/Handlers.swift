
import SwiftTelegramBot

final class Handlers: TGDefaultDispatcher, @unchecked Sendable {
    override func handle() async {
        await meow(bot: bot)
    }
}
