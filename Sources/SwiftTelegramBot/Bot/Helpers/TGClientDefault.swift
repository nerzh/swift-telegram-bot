//
//  TGClientDefault.swift
//  SwiftTelegramSdk
//
//  Modified by Oleh Hudeichuk on 04.09.2025.
//
//
//  Created by Maxim Lanskoy on 06.07.2024.
//

import Foundation
import Logging
import class SwiftExtensionsPack.Net
import enum SwiftExtensionsPack.NetBody
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public enum TGHTTPMediaType: String, Equatable {
    case formData
    case json
}

private struct TGEmptyParams: Encodable {}

public final class TGClientDefault: TGClientPrtcl {
    public typealias HTTPMediaType = SwiftTelegramBot.HTTPMediaType
    public let log: SendableValue<Logger> = .init(
        .init(label: "URLSessionTGClient")
    )
    private let session: URLSession

    public convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        self.init(session: URLSession(configuration: configuration))
    }

    init(session: URLSession) {
        self.session = session
    }

    @discardableResult
    public func post<Params: Encodable, Response: Decodable>(
        _ url: URL,
        params: Params? = nil,
        as mediaType: HTTPMediaType? = nil
    ) async throws -> Response {
        let body = try await makeBody(params ?? TGEmptyParams(), as: mediaType)
        let (data, response) = try await Net.sendRequest(
            url: url.absoluteString, method: "POST", body: body, session: session
        )
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw BotError(
                type: .network,
                reason: "Invalid response from server"
            )
        }

        let telegramContainer: TGTelegramContainer<Response> = try JSONDecoder().decode(TGTelegramContainer<Response>.self, from: data)
        return try await processContainer(telegramContainer)
    }

    @discardableResult
    public func post<Response: Decodable>(_ url: URL) async throws -> Response {
        try await post(url, params: TGEmptyParams(), as: nil)
    }

    private func makeBody(_ params: any Encodable, as mediaType: HTTPMediaType?) async throws -> NetBody {
        if let mediaType, mediaType != .formData {
            return .json(params)
        }

        let logger = await log.value
        do {
            let multipart = try params.toMultiPartFormData(log: logger)
            return .raw(data: multipart.body as Data, contentType: .custom("multipart/form-data; boundary=\(multipart.boundary)"))
        } catch {
            logger.critical("Post request error: \(error.localizedDescription)")
            throw error
        }
    }

    private func processContainer<T: Decodable>(
        _ container: TGTelegramContainer<T>
    ) async throws -> T {
        guard container.ok else {
            let desc = """
                Response marked as `not Ok`, it seems something wrong with request
                Code: \(container.errorCode ?? -1)
                \(container.description ?? "Empty")
                """
            let error = BotError(
                type: .server,
                description: desc
            )
            await log.value.error(error.logMessage)
            throw error
        }

        guard let result = container.result else {
            let error = BotError(
                type: .server,
                reason:
                    "Response marked as `Ok`, but doesn't contain `result` field."
            )
            await log.value.error(error.logMessage)
            throw error
        }

        let logString = """
            Response:
            Code: \(container.errorCode ?? 0)
            Status OK: \(container.ok)
            Description: \(container.description ?? "Empty")
            """
        await log.value.trace(logString.logMessage)
        return result
    }
}
