
import Foundation
import SwiftTelegramBot

extension Handlers {
    func meow(bot: TGBot) async {
        let hndlr = TGMessageHandler() { upd in
            guard ["ping","meow","мяу","мявк","нявк","ня","мяв","няв","няу","nya"].contains(upd.message?.text?.lowercased())
            else { return }
            
            guard let msg = ["Meow!","Няв!","Нявк!","Няяяяяя!!","Няфффф!","Nya!!!"].randomElement()
            else { fatalError() }
            
            try await bot.sendMessage(chatId: upd.custChatId, msg, replyTo: upd.message)
        }
        await add(hndlr)
    }
}
