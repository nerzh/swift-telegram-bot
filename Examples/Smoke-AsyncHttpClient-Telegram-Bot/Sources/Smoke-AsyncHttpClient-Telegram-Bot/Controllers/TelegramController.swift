//
//  TelegramController.swift
//  Smoke-AsyncHttpClient-bot-example
//
//  Created by Oleh Hudeichuk on 10.03.2023.
//

import Foundation
import SmokeOperations
import SmokeOperationsHTTP1
import SwiftTelegramBot

struct TelegramController {
    static func telegramWebHookHandler(input: TGUpdate, context: TelegramApplicationContext) throws -> Void {
        Task {
            await context.botActor.bot.processing(updates: [input])
        }
    }
}
