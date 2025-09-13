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
    private let session: URLSession = URLSession(configuration: {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        //        config.timeoutIntervalForRequest  = 1000
        //        config.timeoutIntervalForResource = 0
        return config
    }())

    @discardableResult
    public func post<Params: Encodable, Response: Decodable>(
        _ url: URL,
        params: Params? = nil,
        as mediaType: HTTPMediaType? = nil
    ) async throws -> Response {
        let request = try await makeRequest(url: url, params: params, as: mediaType)
        let (data, response) = try await session.data(for: request)
        
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

    private func makeRequest<Params: Encodable>(
        url: URL,
        params: Params?,
        as mediaType: HTTPMediaType?
    ) async throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        if mediaType == .formData || mediaType == nil {
            var rawMultipart: (body: NSMutableData, boundary: String)!
            do {
                if let currentParams = params {
                    rawMultipart = try currentParams.toMultiPartFormData(
                        log: await log.value
                    )
                } else {
                    rawMultipart = try TGEmptyParams().toMultiPartFormData(
                        log: await log.value
                    )
                }
            } catch {
                await log.value.critical(
                    "Post request error: \(error.localizedDescription)"
                )
                throw error
            }
            request.setValue(
                "multipart/form-data; boundary=\(rawMultipart.boundary)",
                forHTTPHeaderField: "Content-Type"
            )
            request.httpBody = rawMultipart.body as Data
        } else {
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let encodable: Encodable = params ?? TGEmptyParams()
            let data = try JSONEncoder().encode(encodable)
            request.httpBody = data
        }

        return request
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
