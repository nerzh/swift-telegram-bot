import Foundation
import XCTest
@testable import SwiftTelegramBot

final class LongPollingRetryTests: XCTestCase, @unchecked Sendable {
    func testOnlyExplicitRetryAfterDelaysPollingWhenLimiterIsDisabled() async throws {
        let offline = URLError(.notConnectedToInternet)
        let serverError = BotError(httpStatusCode: 503, reason: "Service unavailable")
        let missingDelay = BotError(httpStatusCode: 429, reason: "Too many requests")
        let floodControl = BotError(httpStatusCode: 429, parameters: .init(retryAfter: 17), reason: "Too many requests")
        let client = PollingClient(responses: [serverError, serverError, offline, nil, missingDelay, floodControl])
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: client, botId: "test", apiRequestLimitLongPolling: nil)
        let connection = TGLongPollingConnection(log: await bot.log)
        let finished = expectation(description: "Polling reached the explicit retry delay")

        await connection.startPolling(bot: bot) { nanoseconds in
            XCTAssertEqual(nanoseconds, 17_000_000_000)
            finished.fulfill()
            throw CancellationError()
        }
        await fulfillment(of: [finished], timeout: 3)
        try await connection.stop(bot: bot)
        let polls = await client.count.value
        XCTAssertEqual(polls, client.responses.count)
    }

    func testStopInterruptsTelegramRetryAfter() async throws {
        let floodControl = BotError(httpStatusCode: 429, parameters: .init(retryAfter: 17), reason: "Too many requests")
        let client = PollingClient(responses: [floodControl])
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: client, botId: "test", apiRequestLimitLongPolling: nil)
        let connection = TGLongPollingConnection(log: await bot.log)
        let sleeping = expectation(description: "Polling is waiting to retry")
        let cancelled = expectation(description: "Stop cancelled the wait")

        await connection.startPolling(bot: bot) { _ in
            sleeping.fulfill()
            do {
                try await Task.sleep(nanoseconds: 60_000_000_000)
            } catch is CancellationError {
                cancelled.fulfill()
                throw CancellationError()
            }
        }
        await fulfillment(of: [sleeping], timeout: 3)
        try await connection.stop(bot: bot)
        await fulfillment(of: [cancelled], timeout: 3)
        let polls = await client.count.value
        XCTAssertEqual(polls, 1)
    }
}

private struct PollingClient: TGClientPrtcl {
    let responses: [(any Error)?]
    let count = SendableValue(0)

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        try await post(url)
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        XCTAssertEqual(url.lastPathComponent, "getUpdates")
        let attempt = await count.change { $0 += 1 }
        guard attempt <= responses.count else {
            XCTFail("Unexpected getUpdates call")
            try await Task.sleep(nanoseconds: 60_000_000_000)
            throw CancellationError()
        }
        if let error = responses[attempt - 1] { throw error }
        return try JSONDecoder().decode(Response.self, from: Data("[]".utf8))
    }
}
