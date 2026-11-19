//
//  Created by Oleh Hudeichuk on 19.11.2026.
//

import Foundation
import Logging
import class SwiftExtensionsPack.SafeValue

public final class TGLongPollingConnection: TGConnectionPrtcl {
    private let limit: Int?
    private let timeout: Int?
    public let allowedUpdates: [TGUpdate.CodingKeys]?

    private let offsetUpdates: SendableValue<Int> = .init(0)
    private let log: Logger
    // Holds deleteWebhook during startup, then the polling loop.
    private let activeTask = SafeValue<Task<Void, Error>?>(nil)

    public init(
        limit: Int? = nil,
        timeout: Int? = 10,
        allowedUpdates: [TGUpdate.CodingKeys]? = nil,
        log: Logger
    ) {
        self.log = log
        self.limit = limit
        self.timeout = timeout ?? 10
        self.allowedUpdates = allowedUpdates
    }

    @discardableResult
    nonisolated(nonsending)
    public func start(bot: TGBot) async throws -> Bool {
        try Task.checkCancellation()
        // Register the request before the first await so stop() can cancel it.
        let deleteWebhookTask = activeTask.change { currentTask -> Task<Void, Error>? in
            guard currentTask == nil else { return nil }
            let request = Task<Void, Error> {
                try Task.checkCancellation()
                // Telegram requires the webhook to be removed before getUpdates.
                let removed = try await bot.deleteWebhook(params: .init(dropPendingUpdates: false))
                guard removed else {
                    throw BotError(type: .server, reason: "Telegram did not confirm webhook removal")
                }
            }
            currentTask = request
            return request
        }
        guard let deleteWebhookTask else { throw BotError("Bot already started") }

        // Wait for Telegram's reply. Cancelling start() also cancels its HTTP request.
        let webhookResult = await withTaskCancellationHandler(
            operation: { await deleteWebhookTask.result },
            onCancel: { deleteWebhookTask.cancel() }
        )

        let startResult: Result<Bool, Error> = activeTask.change { currentTask in
            // Check and replace under the same lock: stop() may have removed this
            // request while we awaited Telegram. A later start may already own the slot.
            guard currentTask == deleteWebhookTask else {
                return .failure(CancellationError())
            }
            // The caller can cancel start() even if the transport returns success.
            if Task.isCancelled {
                currentTask = nil
                return .failure(CancellationError())
            }

            switch webhookResult {
            case .failure(let error):
                currentTask = nil
                return .failure(error)
            case .success:
                // From here on, stop() cancels getUpdates and its polling loop.
                currentTask = pollingTask(bot: bot)
                return .success(true)
            }
        }
        return try startResult.get()
    }

    private func pollingTask(bot: TGBot) -> Task<Void, Error> {
        Task.detached { [weak self] in
            while !Task.isCancelled {
                guard let self else { return }
                do {
                    let updates = try await self.getUpdates(bot: bot)
                    try Task.checkCancellation()
                    await bot.processing(updates: updates)
                } catch {
                    guard !Task.isCancelled else { return }
                    let botError = BotError(error)
                    self.log.error("\(botError.localizedDescription)")
                    guard
                        let seconds = botError.floodControlRetryAfter,
                        !(await bot.tgClient is TGRateLimitedClient)
                    else {
                        continue
                    }
                    let nanoseconds = min(UInt64(seconds), UInt64.max / 1_000_000_000) * 1_000_000_000
                    try await Task.sleep(nanoseconds: nanoseconds)
                }
            }
        }
    }

    @discardableResult
    nonisolated(nonsending)
    public func stop(bot: TGBot) async throws -> Bool {
        // Remove the task before cancelling it so a late reply cannot start polling.
        let task = activeTask.change { currentTask in
            let taskToCancel = currentTask
            currentTask = nil
            return taskToCancel
        }
        task?.cancel()
        return true
    }

    private func getUpdates(bot: TGBot) async throws -> [TGUpdate] {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map { $0.rawValue }
        let newOffset: Int? =
            await offsetUpdates.value == 0 ? nil : await offsetUpdates.value
        let params: TGGetUpdatesParams = .init(
            offset: newOffset,
            limit: limit,
            timeout: timeout,
            allowedUpdates: allowedUpdates
        )
        let response = try await bot.getUpdates(params: params)
        try Task.checkCancellation()
        if let lastUpdate: TGUpdate = response.last {
            await offsetUpdates.change { offset in
                if !Task.isCancelled { offset = lastUpdate.updateId + 1 }
            }
        }
        return response
    }
}
