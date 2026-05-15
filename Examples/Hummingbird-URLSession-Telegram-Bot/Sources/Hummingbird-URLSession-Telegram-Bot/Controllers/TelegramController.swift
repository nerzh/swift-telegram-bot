//
//  TelegramController.swift
//  Hummingbird-URLSession-bot-example
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Hummingbird
import SwiftTelegramBot

struct TelegramController: Sendable {

    let updates: TelegramUpdateQueue

    func addRoutes(to group: RouterGroup<some RequestContext>) {
        group.post("telegramWebHook") { req, context in
            let update: TGUpdate = try await req.decode(as: TGUpdate.self, context: context)
            guard updates.enqueue(update) else {
                throw HTTPError(.serviceUnavailable, message: "Telegram update queue is full")
            }
            return Response(status: 200)
        }
    }

}
