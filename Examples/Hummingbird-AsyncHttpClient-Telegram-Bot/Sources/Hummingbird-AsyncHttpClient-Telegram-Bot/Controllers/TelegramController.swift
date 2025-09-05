//
//  TelegramController.swift
//  Hummingbird-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation
import Hummingbird
import SwiftTelegramBot

final class TelegramController {
    func addRoutes(to group: RouterGroup<some RequestContext>) {
        group.post("telegramWebHook") { req, context in
            let update: TGUpdate = try await req.decode(as: TGUpdate.self, context: context)
            Task {
                await botActor.bot.processing(updates: [update])
            }
            return Response(status: 200)
        }
    }
}
