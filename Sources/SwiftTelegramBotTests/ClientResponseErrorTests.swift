import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
@testable import SwiftTelegramBot

final class ClientResponseErrorTests: XCTestCase, @unchecked Sendable {
    func testRateLimitExposesRetryAfterAndSeparateErrorCodes() async throws {
        do {
            _ = try await post("/rate-limit")
            XCTFail("Expected a Telegram error")
        } catch let error as BotError {
            XCTAssertEqual(error.type, .server)
            XCTAssertEqual(error.httpStatusCode, 429)
            XCTAssertEqual(error.errorCode, 429)
            XCTAssertEqual(error.reason, "Too Many Requests: retry after 17")
            XCTAssertEqual(error.parameters?.retryAfter, 17)
            XCTAssertEqual(BotError(error as Error).parameters?.retryAfter, 17)
        }
    }

    func testBothPostOverloadsBlockSharedSlotsBeforeThrowingRateLimitError() async throws {
        let session = makeSession()
        defer { session.invalidateAndCancel() }

        for withParams in [false, true] {
            let client = TGRateLimitedClient(client: TGClientDefault(session: session),
                                             limiter: .init(maxRequests: 5, per: 1))
            let path = withParams ? "http-rate-limit" : "telegram-rate-limit"
            let url = URL(string: "https://example.invalid/" + path)!
            let start = DispatchTime.now()
            do {
                if withParams {
                    let _: Bool = try await client.post(url, params: ["key": "value"], as: .json)
                } else {
                    let _: Bool = try await client.post(url)
                }
                XCTFail("Expected the flood control error to reach the caller")
            } catch let error as BotError {
                XCTAssertEqual(error.httpStatusCode, withParams ? 429 : 200)
                XCTAssertEqual(error.parameters?.retryAfter, 17)
            }

            guard case .retryAt(let deadline) = await client.limiter.tryAcquire() else {
                return XCTFail("Expected all remaining slots to be blocked")
            }
            XCTAssertGreaterThanOrEqual(deadline, start + .seconds(17))
            XCTAssertLessThanOrEqual(deadline, .now() + .seconds(17))
        }
    }

    func testErrorsWithoutFloodControlDelayLeaveOtherSlotsAvailable() async throws {
        let session = makeSession()
        defer { session.invalidateAndCancel() }
        for path in ["missing-delay", "zero-delay", "negative-delay", "unrelated-error"] {
            let client = TGRateLimitedClient(client: TGClientDefault(session: session),
                                             limiter: .init(maxRequests: 5, per: 1))
            let url = URL(string: "https://example.invalid/" + path)!
            do {
                let _: Bool = try await client.post(url)
                XCTFail("Expected an error for \(path)")
            } catch is BotError {}
            let slot = await client.limiter.tryAcquire()
            XCTAssertEqual(slot, .acquired, path)
        }
    }

    func testMigrationKeepsFullChatID() async throws {
        do {
            _ = try await post("/migration")
            XCTFail("Expected a migration error")
        } catch let error as BotError {
            XCTAssertEqual(error.httpStatusCode, 400)
            XCTAssertEqual(error.errorCode, 400)
            XCTAssertEqual(error.parameters?.migrateToChatId, -1_001_234_567_890)
        }
    }

    func testTelegramErrorOnHTTP200() async throws {
        do {
            _ = try await post("/telegram-error")
            XCTFail("Expected ok=false to throw")
        } catch let error as BotError {
            XCTAssertEqual(error.httpStatusCode, 200)
            XCTAssertEqual(error.errorCode, 403)
            XCTAssertEqual(error.reason, "Forbidden")
        }
    }

    func testNonJSONHTTPErrorPreservesStatusAndText() async throws {
        do {
            _ = try await post("/gateway")
            XCTFail("Expected an HTTP error")
        } catch let error as BotError {
            XCTAssertEqual(error.httpStatusCode, 502)
            XCTAssertEqual(error.reason, "Bad Gateway")
            XCTAssertNil(error.errorCode)
            XCTAssertNil(error.parameters)
        }
    }

    func testOnlyHTTP200CanReturnASuccessfulResult() async throws {
        for status in [205, 287] {
            do {
                _ = try await post("/status/\(status)")
                XCTFail("Expected HTTP \(status) to throw")
            } catch let error as BotError {
                XCTAssertEqual(error.httpStatusCode, status)
            }
        }
    }

    func testInvalidResultOnSuccessfulResponseStillThrowsDecodingError() async throws {
        do {
            _ = try await post("/invalid-result")
            XCTFail("Expected a decoding error")
        } catch is DecodingError {}
    }

    private func post(_ path: String) async throws -> Bool {
        let session = makeSession()
        defer { session.invalidateAndCancel() }
        return try await TGClientDefault(session: session).post(URL(string: "https://example.invalid" + path)!)
    }

    private func makeSession() -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [ErrorResponseProtocol.self]
        return URLSession(configuration: config)
    }
}

private final class ErrorResponseProtocol: URLProtocol, @unchecked Sendable {
    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        let url = request.url!
        let (status, body): (Int, String)
        switch url.path {
        case "/rate-limit":
            status = 429
            body = #"{"ok":false,"description":"Too Many Requests: retry after 17","error_code":429,"parameters":{"retry_after":17}}"#
        case "/http-rate-limit":
            status = 429
            body = #"{"ok":false,"parameters":{"retry_after":17}}"#
        case "/telegram-rate-limit":
            status = 200
            body = #"{"ok":false,"error_code":429,"parameters":{"retry_after":17}}"#
        case "/missing-delay":
            status = 429
            body = #"{"ok":false}"#
        case "/zero-delay":
            status = 429
            body = #"{"ok":false,"parameters":{"retry_after":0}}"#
        case "/negative-delay":
            status = 429
            body = #"{"ok":false,"parameters":{"retry_after":-1}}"#
        case "/unrelated-error":
            status = 400
            body = #"{"ok":false,"error_code":400,"parameters":{"retry_after":17}}"#
        case "/migration":
            status = 400
            body = #"{"ok":false,"description":"Chat migrated","error_code":400,"parameters":{"migrate_to_chat_id":-1001234567890}}"#
        case "/telegram-error":
            status = 200
            body = #"{"ok":false,"error_code":403,"description":"Forbidden"}"#
        case "/gateway":
            status = 502
            body = "Bad Gateway"
        case "/invalid-result":
            status = 200
            body = #"{"ok":true,"result":"not a boolean"}"#
        case "/status/205", "/status/287":
            status = Int(url.lastPathComponent)!
            body = #"{"ok":true,"result":true}"#
        default:
            XCTFail("Unexpected request path: \(url.path)")
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
            return
        }
        let response = HTTPURLResponse(url: url, statusCode: status, httpVersion: nil, headerFields: nil)!
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: Data(body.utf8))
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
