import Foundation

#if canImport(ServiceLifecycle)
public import ServiceLifecycle

extension TGBot: Service {
    public func run() async throws {

        guard case .longpolling = connectionType else {
            throw BotError("""
            TGBot can be run as a Service only with long polling.
            For webhook connections, use a dedicated webhook service that owns
            the HTTP update queue and calls bot.processing(updates:).
            """)
        }

        try await start()
        do {
            try await gracefulShutdown()
        } catch is CancellationError {
             // ServiceLifecycle uses cancellation as the normal graceful shutdown path.
        } catch {
            try await stop()
            throw error
        }

        try await stop()
    }
}
#endif
