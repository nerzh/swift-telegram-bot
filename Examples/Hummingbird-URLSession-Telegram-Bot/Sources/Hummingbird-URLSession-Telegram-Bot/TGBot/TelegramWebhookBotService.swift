import Foundation
import SwiftTelegramBot
import ServiceLifecycle

struct TelegramWebhookBotService: Service {
    let bot: TGBot
    let updates: TelegramUpdateQueue

    func run() async throws {
        try await bot.start()
        await withTaskCancellationOrGracefulShutdownHandler {
            for await update in updates.stream {
                await bot.processing(updates: [update])
            }
        } onCancelOrGracefulShutdown: {
            updates.finishAcceptingNewUpdates()
        }
        try await bot.stop()
    }
}

final class TelegramUpdateQueue: Sendable {

    let stream: AsyncStream<TGUpdate>

    private let continuation: AsyncStream<TGUpdate>.Continuation

    init(limit: Int = 100) {
        (stream, continuation) = AsyncStream.makeStream(
            of: TGUpdate.self,
            bufferingPolicy: .bufferingOldest(limit)
        )
    }

    func enqueue(_ update: TGUpdate) -> Bool {
        switch continuation.yield(update) {
        case .enqueued:
            return true
        case .dropped, .terminated:
            return false
        @unknown default:
            return false
        }
    }

    func finishAcceptingNewUpdates() {
        continuation.finish()
    }

}
