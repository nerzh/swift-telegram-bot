import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import XCTest
import class SwiftExtensionsPack.Net
@testable import SwiftTelegramBot

final class ClientRequestTests: XCTestCase, @unchecked Sendable {
    func testBotAndCachedClientShareOneLimitAcrossElevenPosts() async throws {
        let transport = CountingClient()
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: transport, botId: "test")
        let client = await bot.tgClient
        let url = URL(string: "https://example.invalid/test")!
        let finished = expectation(description: "All eleven requests reached the transport")
        let start = DispatchTime.now().uptimeNanoseconds
        let worker = Task {
            defer { finished.fulfill() }
            do {
                try await withThrowingTaskGroup(of: Bool.self) { group in
                    for i in 0..<10 {
                        group.addTask {
                            if i.isMultiple(of: 2) { return try await bot.deleteWebhook() }
                            return try await client.post(url)
                        }
                    }
                    for try await result in group { XCTAssertTrue(result) }
                }
                let result: Bool = try await client.post(url)
                XCTAssertTrue(result)
            } catch {
                XCTFail("Unexpected error: \(error)")
            }
        }
        await fulfillment(of: [finished], timeout: 6)
        worker.cancel()
        let calls = await transport.calls.value
        XCTAssertEqual(calls.count, 11)
        XCTAssertEqual(calls.filter { $0 == "deleteWebhook" }.count, 5)
        XCTAssertGreaterThanOrEqual(DispatchTime.now().uptimeNanoseconds - start, 2_000_000_000)
    }

    func testCancelledRequestDoesNotReachCustomTransport() async throws {
        let transport = CountingClient()
        let bot = try await TGBot(connectionType: .webhook(webHookURL: TGBot.standardTGURL),
                                  tgClient: transport, botId: "test", apiRequestLimitWebHook: 1)
        try await bot.deleteWebhook()
        let waiting = Task { try await bot.logOut() }
        waiting.cancel()
        do {
            _ = try await waiting.value
            XCTFail("Expected cancellation")
        } catch is CancellationError {}
        let calls = await transport.calls.value
        XCTAssertEqual(calls, ["deleteWebhook"])
    }

    func testDefaultClientSendsJSONAndTelegramMultipart() async throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [EchoRequestProtocol.self]
        let session = URLSession(configuration: configuration)
        defer { session.invalidateAndCancel() }
        let client = TGClientDefault(session: session)
        let url = URL(string: "https://example.invalid/test")!
        let params = ["name": "hello"]

        let json: EchoedRequest = try await client.post(url, params: params, as: .json)
        XCTAssertEqual(json.method, "POST")
        XCTAssertEqual(json.contentType, "application/json")
        XCTAssertEqual(try JSONDecoder().decode([String: String].self, from: json.body), params)

        let upload = TGSendDocumentParams(chatId: .chat(123), document: .file(.init(filename: "a.txt", data: Data("hello".utf8))))
        let multipart: EchoedRequest = try await client.post(url, params: upload, as: nil)
        let prefix = "multipart/form-data; boundary="
        XCTAssertTrue(multipart.contentType.hasPrefix(prefix))
        let boundary = multipart.contentType.dropFirst(prefix.count)
        let body = String(decoding: multipart.body, as: UTF8.self)
        XCTAssertTrue(body.hasPrefix("--\(boundary)\r\n"))
        XCTAssertTrue(body.hasSuffix("--\(boundary)--"))
        XCTAssertTrue(body.contains("name=\"document\"; filename=\"a.txt\""))
        XCTAssertTrue(body.contains("Content-Type: application/octet-stream\r\n"))
        XCTAssertTrue(body.contains("\r\n\r\nhello\r\n"))
    }

    func testUploadedFilePreservesMIMETypeAndBinaryData() async throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [EchoRequestProtocol.self]
        let session = URLSession(configuration: configuration)
        defer { session.invalidateAndCancel() }
        let client = TGClientDefault(session: session)
        let url = URL(string: "https://example.invalid/test")!
        let data = Data([0, 0xFF, 0x80, 13, 10, 42])
        let cases: [(mime: String?, expected: String)] = [
            (nil, "application/octet-stream"),
            ("", "application/octet-stream"),
            (" \t ", "application/octet-stream"),
            ("image/png", "image/png"),
            ("text/plain; charset=UTF-8", "text/plain; charset=UTF-8"),
            ("application/vnd.example+json; profile=\"CaseSensitive\"", "application/vnd.example+json; profile=\"CaseSensitive\"")
        ]
        for (mime, expected) in cases {
            let upload = TGSendDocumentParams(
                chatId: .chat(123),
                document: .file(.init(filename: "upload.bin", data: data, mimeType: mime))
            )
            let request: EchoedRequest = try await client.post(url, params: upload, as: nil)
            let filePart = Data(("filename=\"upload.bin\"\r\nContent-Type: " + expected + "\r\n\r\n").utf8)
                + data + Data("\r\n".utf8)
            XCTAssertNotNil(request.body.range(of: filePart), expected)
            XCTAssertTrue(request.contentType.hasPrefix("multipart/form-data; boundary="))
        }
    }

    func testInvalidMIMETypeDoesNotModifyMultipartBody() throws {
        let multipart = NetMultipartData(boundary: "test-boundary", log: .init(label: "multipart-tests"))
        try multipart.append("chat_id", "123")
        let original = multipart.body as Data
        for mime in ["not-a-media-type", "text/plain\r\nX-Injected: yes"] {
            XCTAssertThrowsError(try multipart.appendFile("document", Data([42]), "a.bin", mimeType: mime)) { error in
                guard case Net.NetErrors.InvalidContentType = error else {
                    return XCTFail("Unexpected error: \(error)")
                }
            }
            XCTAssertEqual(multipart.body as Data, original)
        }
        try multipart.appendFile("document", Data([42]), "a.bin", mimeType: "image/png")
        let body = String(decoding: try multipart.finalizeBodyAndGetData() as Data, as: UTF8.self)
        XCTAssertTrue(body.contains("Content-Type: image/png\r\n\r\n*\r\n--test-boundary--"))
    }
}

private struct CountingClient: TGClientPrtcl {
    let calls = SendableValue<[String]>([])

    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response {
        await calls.change { $0.append(url.lastPathComponent) }
        return try JSONDecoder().decode(Response.self, from: Data("true".utf8))
    }

    func post<Response: Decodable>(_ url: URL) async throws -> Response {
        try await post(url, params: Optional<String>.none, as: nil)
    }
}

private struct EchoedRequest: Codable {
    let method: String
    let contentType: String
    let body: Data
}

private final class EchoRequestProtocol: URLProtocol, @unchecked Sendable {
    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        do {
            var body = request.httpBody ?? Data()
            if let stream = request.httpBodyStream {
                stream.open()
                defer { stream.close() }
                var buffer = [UInt8](repeating: 0, count: 4096)
                while true {
                    let count = stream.read(&buffer, maxLength: buffer.count)
                    if count < 0 { throw stream.streamError ?? URLError(.cannotDecodeContentData) }
                    if count == 0 { break }
                    body.append(contentsOf: buffer.prefix(count))
                }
            }
            let result = EchoedRequest(method: request.httpMethod ?? "", contentType: request.value(forHTTPHeaderField: "Content-Type") ?? "", body: body)
            let reply = try JSONEncoder().encode(result)
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: Data("{\"ok\":true,\"result\":".utf8) + reply + Data("}".utf8))
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}
