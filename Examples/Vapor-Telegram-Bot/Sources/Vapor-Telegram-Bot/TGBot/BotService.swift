//
//  BotService.swift
//  Vapor-Telegram-Bot
//
//  Created by Oleh Hudeichuk on 05.09.2025.
//

import Vapor
import SwiftTelegramBot

extension Application {
    private struct TGServiceServiceKey: StorageKey {
        typealias Value = TGBot
    }

    var bot: TGBot {
        get {
            guard let service = storage[TGServiceServiceKey.self] else {
                fatalError("TGBot not configured. Use app.bot = ...")
            }
            return service
        }
        set {
            storage[TGServiceServiceKey.self] = newValue
        }
    }
}
