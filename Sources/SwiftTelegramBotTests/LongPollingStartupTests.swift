import Foundation
import XCTest
@testable import SwiftTelegramBot

final class LongPollingStartupTests: XCTestCase, @unchecked Sendable {
    func testSameBotCanRestartAfterFailureAndStop() async throws {
        let deletes = SendableValue(0)
        let recoveredPoll = expectation(description: "Polling started after the failed request")
        let restartedPoll = expectation(description: "Polling restarted after stop")
        let client = StartupClient(deleteWebhook: {
            let attempt = await deletes.change { $0 += 1 }
            if attempt == 1 { throw URLError(.timedOut) }
            return attempt != 2
        }, onPoll: {
            if await deletes.value == 3 { recoveredPoll.fulfill() } else { restartedPoll.fulfill() }
        })
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: client, botId: "test", apiRequestLimitLongPolling: nil)
        addTeardownBlock { _ = try await bot.stop() }

        do {
            _ = try await bot.start()
            XCTFail("Expected the first deleteWebhook to fail")
        } catch let error as URLError {
            XCTAssertEqual(error.code, .timedOut)
        }
        do {
            _ = try await bot.start()
            XCTFail("Expected an unconfirmed deletion to prevent polling")
        } catch let error as BotError {
            XCTAssertEqual(error.type, .server)
        }
        let recovered = try await bot.start()
        XCTAssertTrue(recovered)
        await fulfillment(of: [recoveredPoll], timeout: 3)
        try await bot.stop()
        let restarted = try await bot.start()
        XCTAssertTrue(restarted)
        let attempts = await deletes.value
        XCTAssertEqual(attempts, 4)
        await fulfillment(of: [restartedPoll], timeout: 3)
    }

    func testLateStartupCannotClearNewPollingRun() async throws {
        let deletes = SendableValue(0)
        let firstDelete = expectation(description: "The first deleteWebhook is pending")
        let polled = expectation(description: "The second run reached getUpdates")
        let (replies, server) = AsyncStream<Void>.makeStream()
        defer { server.finish() }
        let lateReply = Task { for await _ in replies { break } }
        let client = StartupClient(deleteWebhook: {
            let attempt = await deletes.change { $0 += 1 }
            if attempt == 1 {
                firstDelete.fulfill()
                await lateReply.value
            }
            return true
        }, onPoll: { polled.fulfill() })
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: client, botId: "test", apiRequestLimitLongPolling: nil)
        addTeardownBlock { _ = try await bot.stop() }

        let firstStart = Task { try await bot.start() }
        await fulfillment(of: [firstDelete], timeout: 3)
        try await bot.stop()
        let restarted = try await bot.start()
        XCTAssertTrue(restarted)
        server.finish()
        do {
            _ = try await firstStart.value
            XCTFail("Expected the interrupted start to throw")
        } catch is CancellationError {}
        do {
            _ = try await bot.start()
            XCTFail("The second polling run is still active")
        } catch let error as BotError {
            XCTAssertEqual(error.reason, "Bot already started")
        }
        await fulfillment(of: [polled], timeout: 3)
        let attempts = await deletes.value
        XCTAssertEqual(attempts, 2)
    }

    func testDeleteWebhookFailureReachesCallerWithoutStartingPolling() async throws {
        let polled = expectation(description: "getUpdates was sent")
        polled.isInverted = true
        let transport = StartupClient(deleteWebhook: { throw URLError(.timedOut) }, onPoll: { polled.fulfill() })
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: transport, botId: "test")
        addTeardownBlock { _ = try await bot.stop() }

        do {
            _ = try await bot.start()
            XCTFail("Expected the deleteWebhook error")
        } catch let error as URLError {
            XCTAssertEqual(error.code, .timedOut)
        }
        await fulfillment(of: [polled], timeout: 0.1)
    }

    func testCancellingStartCancelsDeleteWebhookAndSkipsPolling() async throws {
        let deleting = expectation(description: "deleteWebhook reached the transport")
        let cancelled = expectation(description: "The caller cancelled deleteWebhook")
        let polled = expectation(description: "getUpdates was sent")
        polled.isInverted = true
        let (replies, server) = AsyncStream<Void>.makeStream()
        let transport = StartupClient(deleteWebhook: {
            await withTaskCancellationHandler {
                deleting.fulfill()
                for await _ in replies { break }
            } onCancel: {
                cancelled.fulfill()
            }
            return true
        }, onPoll: { polled.fulfill() })
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: transport, botId: "test")
        addTeardownBlock { _ = try await bot.stop() }
        let starting = Task { try await bot.start() }
        await fulfillment(of: [deleting], timeout: 3)

        starting.cancel()
        await fulfillment(of: [cancelled], timeout: 3)
        server.finish()
        do {
            _ = try await starting.value
            XCTFail("Expected cancellation")
        } catch is CancellationError {}
        await fulfillment(of: [polled], timeout: 0.1)
    }

    func testStopDuringDeleteWebhookPreventsPollingAfterLateSuccess() async throws {
        let deleting = expectation(description: "deleteWebhook reached the transport")
        let cancelled = expectation(description: "Stop cancelled deleteWebhook")
        let stopped = expectation(description: "Stop returned before the server replied")
        let polled = expectation(description: "getUpdates was sent")
        polled.isInverted = true

        let (replies, server) = AsyncStream<Void>.makeStream()
        let response = Task {
            var iterator = replies.makeAsyncIterator()
            _ = await iterator.next()
        }
        let transport = StartupClient(deleteWebhook: {
            await withTaskCancellationHandler {
                deleting.fulfill()
                await response.value
            } onCancel: {
                cancelled.fulfill()
            }
            return true
        }, onPoll: { polled.fulfill() })
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: transport, botId: "test")
        addTeardownBlock { _ = try await bot.stop() }
        let starting = Task { try await bot.start() }
        await fulfillment(of: [deleting], timeout: 3)

        let stopping = Task {
            defer { stopped.fulfill() }
            return try await bot.stop()
        }
        await fulfillment(of: [cancelled, stopped], timeout: 3)
        server.finish()
        let didStop = try await stopping.value
        XCTAssertTrue(didStop)
        do {
            _ = try await starting.value
            XCTFail("Expected the interrupted start to throw")
        } catch is CancellationError {}
        await fulfillment(of: [polled], timeout: 0.1)
    }
}

private struct StartupClient: TGClientPrtcl {
    let deleteWebhook: @Sendable () async throws -> Bool
    let onPoll: @Sendable () async -> Void

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        try await post(url)
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        switch url.lastPathComponent {
        case "deleteWebhook":
            let removed = try await deleteWebhook()
            return try JSONDecoder().decode(Response.self, from: JSONEncoder().encode(removed))
        case "getUpdates":
            await onPoll()
            try await Task.sleep(nanoseconds: 60_000_000_000)
            throw CancellationError()
        default:
            XCTFail("Unexpected method: \(url.lastPathComponent)")
            throw URLError(.badURL)
        }
    }
}
