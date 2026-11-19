import Foundation
import SwiftExtensionsPack

struct TGRateLimitedClient: TGClientPrtcl {
    let client: TGClientPrtcl
    let limiter: LimiterAsync

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        try await withRateLimit { try await client.post(url, params: params, as: mediaType) }
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        try await withRateLimit { try await client.post(url) }
    }

    private func withRateLimit<Response>(_ send: () async throws -> Response) async throws -> Response {
        guard await limiter.acquire() else { throw CancellationError() }
        do {
            return try await send()
        } catch let error as BotError {
            if let seconds = error.floodControlRetryAfter {
                await limiter.blockAllSlots(until: .now() + .seconds(seconds))
            }
            throw error
        }
    }
}
