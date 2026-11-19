import Foundation
import XCTest
@testable import SwiftTelegramBot

final class LongPollingStartupTests: XCTestCase, @unchecked Sendable {
    func testDeleteWebhookFailureReachesCallerWithoutStartingPolling() async throws {
        let polled = expectation(description: "getUpdates was sent")
        polled.isInverted = true
        let transport = StartupClient(waitForReply: { throw URLError(.timedOut) }, polled: polled)
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
        let transport = StartupClient(waitForReply: {
            await withTaskCancellationHandler {
                deleting.fulfill()
                for await _ in replies { break }
            } onCancel: {
                cancelled.fulfill()
            }
        }, polled: polled)
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
        let transport = StartupClient(waitForReply: {
            await withTaskCancellationHandler {
                deleting.fulfill()
                await response.value
            } onCancel: {
                cancelled.fulfill()
            }
        }, polled: polled)
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
    let waitForReply: @Sendable () async throws -> Void
    let polled: XCTestExpectation

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        try await post(url)
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        switch url.lastPathComponent {
        case "deleteWebhook":
            try await waitForReply()
            return try JSONDecoder().decode(Response.self, from: Data("true".utf8))
        case "getUpdates":
            polled.fulfill()
            try await Task.sleep(nanoseconds: 60_000_000_000)
            throw CancellationError()
        default:
            XCTFail("Unexpected method: \(url.lastPathComponent)")
            throw URLError(.badURL)
        }
    }
}
