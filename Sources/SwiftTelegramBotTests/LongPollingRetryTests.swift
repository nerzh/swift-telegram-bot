import Foundation
import XCTest
@testable import SwiftTelegramBot

final class LongPollingRetryTests: XCTestCase, @unchecked Sendable {
    func testOnlyExplicitRetryAfterDelaysPollingWhenLimiterIsDisabled() async throws {
        let offline = URLError(.notConnectedToInternet)
        let serverError = BotError(httpStatusCode: 503, reason: "Service unavailable")
        let missingDelay = BotError(httpStatusCode: 429, reason: "Too many requests")
        let rateLimited = expectation(description: "Telegram returned retry_after")
        let retried = expectation(description: "Polling resumed after retry_after")
        let client = PollingClient(beforeRateLimit: [serverError, serverError, offline, nil, missingDelay],
                                   rateLimited: rateLimited, retried: retried)
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: client, botId: "test", apiRequestLimitLongPolling: nil)
        try await bot.start()
        await fulfillment(of: [rateLimited], timeout: 3)
        await fulfillment(of: [retried], timeout: 3)
        try await bot.stop()
        let times = await client.pollTimes.value
        let index = client.beforeRateLimit.count
        guard times.indices.contains(index + 1) else { return XCTFail("Missing retry") }
        XCTAssertGreaterThanOrEqual(times[index + 1], times[index] + .seconds(1))
    }

    func testStopPreventsRetryAfterFloodControlResponse() async throws {
        let rateLimited = expectation(description: "Telegram returned retry_after")
        let retried = expectation(description: "Polling retried after stop")
        retried.isInverted = true
        let client = PollingClient(beforeRateLimit: [], rateLimited: rateLimited, retried: retried)
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: client, botId: "test", apiRequestLimitLongPolling: nil)
        try await bot.start()
        await fulfillment(of: [rateLimited], timeout: 3)
        try await bot.stop()
        await fulfillment(of: [retried], timeout: 1.5)
    }
}

private struct PollingClient: TGClientPrtcl {
    let beforeRateLimit: [(any Error)?]
    let rateLimited: XCTestExpectation
    let retried: XCTestExpectation
    let pollTimes = SendableValue<[DispatchTime]>([])

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        try await post(url)
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        if url.lastPathComponent == "deleteWebhook" {
            return try JSONDecoder().decode(Response.self, from: Data("true".utf8))
        }
        XCTAssertEqual(url.lastPathComponent, "getUpdates")
        let times = await pollTimes.change { $0.append(.now()) }
        let index = times.count - 1
        if index < beforeRateLimit.count {
            if let error = beforeRateLimit[index] { throw error }
            return try JSONDecoder().decode(Response.self, from: Data("[]".utf8))
        }
        if index == beforeRateLimit.count { rateLimited.fulfill() }
        if index == beforeRateLimit.count + 1 { retried.fulfill() }
        throw BotError(httpStatusCode: 429, parameters: .init(retryAfter: 1), reason: "Too many requests")
    }
}
