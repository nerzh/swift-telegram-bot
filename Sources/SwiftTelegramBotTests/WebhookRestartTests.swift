import Foundation
import XCTest
@testable import SwiftTelegramBot

final class WebhookRestartTests: XCTestCase, @unchecked Sendable {
    func testWebhookConnectionTracksEachBotIndependently() async throws {
        let calls = SendableValue<[String]>([])
        let client = WebhookClient { method in
            await calls.change { $0.append(method) }
            return true
        }
        let url = URL(string: "https://example.invalid/webhook")!
        let connection: any TGConnectionPrtcl = TGWebHookConnection(webHookURL: url)
        let first = try await TGBot(connectionType: .webhook(webHookURL: url), tgClient: client,
                                    botId: "first", apiRequestLimitWebHook: nil)
        let second = try await TGBot(connectionType: .webhook(webHookURL: url), tgClient: client,
                                     botId: "second", apiRequestLimitWebHook: nil)

        try await connection.start(bot: first)
        try await connection.start(bot: second)
        try await connection.stop(bot: first)
        do {
            _ = try await connection.start(bot: second)
            XCTFail("Stopping the first bot must not clear the second bot's registration")
        } catch let error as BotError {
            XCTAssertEqual(error.reason, "Bot already started")
        }
        try await connection.start(bot: first)
        let methods = await calls.value
        XCTAssertEqual(methods, ["setWebhook", "setWebhook", "deleteWebhook", "setWebhook"])
    }

    func testRetryAfterFailedRegistrationAndRestartAfterConfirmedRemoval() async throws {
        let calls = SendableValue<[String]>([])
        let replies: [Result<Bool, URLError>] = [
            .failure(URLError(.timedOut)), .success(false), .success(true),
            .failure(URLError(.timedOut)), .success(false), .success(true), .success(true)
        ]
        let client = WebhookClient { method in
            let history = await calls.change { $0.append(method) }
            let index = history.count - 1
            guard replies.indices.contains(index) else { throw URLError(.badServerResponse) }
            return try replies[index].get()
        }
        let bot = try await TGBot(connectionType: .webhook(webHookURL: TGBot.standardTGURL),
                                  tgClient: client, botId: "test", apiRequestLimitWebHook: nil)

        do {
            _ = try await bot.start()
            XCTFail("Expected registration to time out")
        } catch let error as URLError {
            XCTAssertEqual(error.code, .timedOut)
        }
        let declined = try await bot.start()
        XCTAssertFalse(declined)
        let registered = try await bot.start()
        XCTAssertTrue(registered)

        do {
            _ = try await bot.stop()
            XCTFail("Expected removal to time out")
        } catch let error as URLError {
            XCTAssertEqual(error.code, .timedOut)
        }
        let stillRegistered = try await bot.stop()
        XCTAssertFalse(stillRegistered)
        do {
            _ = try await bot.start()
            XCTFail("Removal was not confirmed")
        } catch let error as BotError {
            XCTAssertEqual(error.reason, "Bot already started")
        }
        let removed = try await bot.stop()
        XCTAssertTrue(removed)
        let restarted = try await bot.start()
        XCTAssertTrue(restarted)
        let methods = await calls.value
        XCTAssertEqual(methods, ["setWebhook", "setWebhook", "setWebhook", "deleteWebhook",
                                 "deleteWebhook", "deleteWebhook", "setWebhook"])
    }

    func testRestartWaitsForPendingWebhookRemoval() async throws {
        let deleting = expectation(description: "deleteWebhook reached the transport")
        let removalFinished = SendableValue(false)
        let registrations = SendableValue(0)
        let (responses, server) = AsyncStream<Void>.makeStream()
        defer { server.finish() }
        let client = WebhookClient { method in
            if method == "deleteWebhook" {
                deleting.fulfill()
                for await _ in responses { break }
                await removalFinished.change { $0 = true }
            } else {
                let count = await registrations.change { $0 += 1 }
                if count == 2 {
                    let finished = await removalFinished.value
                    XCTAssertTrue(finished, "Registration must wait for the previous removal")
                }
            }
            return true
        }
        let bot = try await TGBot(connectionType: .webhook(webHookURL: TGBot.standardTGURL),
                                  tgClient: client, botId: "test", apiRequestLimitWebHook: nil)
        try await bot.start()
        let stop = Task { try await bot.stop() }
        await fulfillment(of: [deleting], timeout: 3)
        let restarting = expectation(description: "Restart requested while removal is pending")
        let restart = Task {
            restarting.fulfill()
            return try await bot.start()
        }
        await fulfillment(of: [restarting], timeout: 3)
        server.finish()
        let stopped = try await stop.value
        let restarted = try await restart.value
        XCTAssertTrue(stopped)
        XCTAssertTrue(restarted)
        let count = await registrations.value
        XCTAssertEqual(count, 2)
    }
}

private struct WebhookClient: TGClientPrtcl {
    let reply: @Sendable (String) async throws -> Bool

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        try await post(url)
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        let value = try await reply(url.lastPathComponent)
        return try JSONDecoder().decode(Response.self, from: JSONEncoder().encode(value))
    }
}
