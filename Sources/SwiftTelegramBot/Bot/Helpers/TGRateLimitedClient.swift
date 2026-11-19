import Foundation
import SwiftExtensionsPack

struct TGRateLimitedClient: TGClientPrtcl {
    let client: TGClientPrtcl
    let limiter: LimiterAsync

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        guard await limiter.acquire() else { throw CancellationError() }
        return try await client.post(url, params: params, as: mediaType)
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        guard await limiter.acquire() else { throw CancellationError() }
        return try await client.post(url)
    }
}
